import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_online_shop/core/services/get_it.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/utils/app_images.dart';
import 'package:user_online_shop/core/widgets/custom_appbar.dart';
import 'package:user_online_shop/core/widgets/custom_dialog.dart';
import 'package:user_online_shop/core/widgets/loading_dialog.dart';
import 'package:user_online_shop/core/widgets/show_snackbar.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/cubit/becom_seller_cubit.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/models/vender_model.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/widgets/become_seller_view_body.dart';
import 'package:user_online_shop/generated/l10n.dart';

class BecomeSellerView extends StatelessWidget {
  const BecomeSellerView({super.key});
  static const routeName = '/become-seller';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: S.of(context).become_seller,
        icon: true,
      ),
      body: BlocProvider(
        create: (context) => BecomSellerCubit(
          getIt.get<VendorRepo>(),
        ),
        child: BecomeSellerViewBlocConsumer(),
      ),
    );
  }
}

class BecomeSellerViewBlocConsumer extends StatelessWidget {
  const BecomeSellerViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<BecomSellerCubit, BecomSellerState>(
      listener: (context, state) {
        if (state is BecomSellerLoading) {
          loadingDialog(context);
        }
        if (state is BecomSellerSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          showSnackBar(
            context,
            'تم تقديم طلبك بنجاح',
            AppColor.green,
          );
          // Navigator.of(context).pushNamedAndRemoveUntil(
          //   MainView.routeName,
          //   (route) => false,
          // );
        }
        if (state is BecomSellerFailed) {
          Navigator.pop(context);
          customDialog(
            context,
            title: state.errMessage,
            image: Assets.imagesErrors,
          );
        }
      },
      child: BecomeSellerViewBody(),
    );
  }
}

class BecomeSellerViewBody1 extends StatefulWidget {
  const BecomeSellerViewBody1({super.key});

  @override
  State<BecomeSellerViewBody1> createState() => _BecomeSellerViewBody1State();
}

class _BecomeSellerViewBody1State extends State<BecomeSellerViewBody1> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController businessDescriptionController =
      TextEditingController();

  bool isLoading = false;
  bool? userHasRequest;

  @override
  void initState() {
    super.initState();
    checkExistingRequest();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    businessDescriptionController.dispose();
    super.dispose();
  }

  Future<void> checkExistingRequest() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final existingRequest = await FirebaseFirestore.instance
        .collection('seller_requests')
        .where('userId', isEqualTo: userId)
        .get();

    setState(() {
      userHasRequest = existingRequest.docs.isNotEmpty;
    });
  }

  Future<void> submitRequest() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      try {
        final userId = FirebaseAuth.instance.currentUser!.uid;

        // تحقق من وجود طلب سابق
        final existingRequest = await FirebaseFirestore.instance
            .collection('seller_requests')
            .where('userId', isEqualTo: userId)
            .get();

        if (existingRequest.docs.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('لقد قمت بتقديم طلب مسبق.')),
          );
          setState(() {
            isLoading = false;
          });
          return;
        }

        // إرسال الطلب
        await FirebaseFirestore.instance
            .collection('seller_requests')
            .doc(userId)
            .set({
          'userId': userId,
          'name': nameController.text,
          'email': emailController.text,
          'phone': phoneController.text,
          'businessDescription': businessDescriptionController.text,
          'status': 'Pending',
          'createdAt': Timestamp.now(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم إرسال طلبك بنجاح. سيتم مراجعته قريبًا.')),
        );

        // إعادة تعيين الحقول بعد الإرسال
        nameController.clear();
        emailController.clear();
        phoneController.clear();
        businessDescriptionController.clear();
        setState(() {
          userHasRequest = true;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('حدث خطأ أثناء إرسال الطلب: $e')),
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userHasRequest == null) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (userHasRequest == true) {
      return Scaffold(
        appBar: AppBar(title: Text('طلب التحول إلى بائع')),
        body: Center(
          child: Text('لقد قمت بالفعل بإرسال طلب. يُرجى انتظار المراجعة.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('طلب التحول إلى بائع')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'الاسم الكامل'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يُرجى إدخال الاسم الكامل.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'البريد الإلكتروني'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يُرجى إدخال البريد الإلكتروني.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'رقم الهاتف'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يُرجى إدخال رقم الهاتف.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: businessDescriptionController,
                decoration: InputDecoration(labelText: 'وصف النشاط التجاري'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يُرجى إدخال وصف النشاط التجاري.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: submitRequest,
                      child: Text('إرسال الطلب'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
