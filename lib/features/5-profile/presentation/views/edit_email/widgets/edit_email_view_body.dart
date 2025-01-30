import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_online_shop/contants.dart';
import 'package:user_online_shop/core/helper_functions/get_user.dart';
import 'package:user_online_shop/core/helper_functions/valid_input.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/utils/app_style.dart';
import 'package:user_online_shop/core/widgets/custom_button.dart';
import 'package:user_online_shop/core/widgets/custom_text_field.dart';
import 'package:user_online_shop/features/2-auth/domain/entities/user_entity.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/edit_email/cubit/edit_email_cubit.dart';
import 'package:user_online_shop/generated/l10n.dart';

class EditEmailViewBody extends StatefulWidget {
  const EditEmailViewBody({super.key});

  @override
  State<EditEmailViewBody> createState() => _EditEmailViewBodyState();
}

class _EditEmailViewBodyState extends State<EditEmailViewBody> {
  UserEntity user2 = getUser();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    emailController.text = user2.email;
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomTextField(
                hintText: S.of(context).enter_email,
                labels: S.of(context).email,
                controller: emailController,
                onSaved: (value) {
                  emailController.text = value!;
                },
                validator: (value) {
                  return validInput(
                    context: context,
                    val: value!,
                    type: 'email',
                    max: 30,
                    min: 5,
                  );
                },
                keyboardType: TextInputType.emailAddress,
                suffixIcon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                title: S.of(context).edit_email,
                buttonColor: AppColor.primaryColor,
                textStyle: AppStyle.styleBold24().copyWith(
                  color: AppColor.white,
                ),
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<EditEmailCubit>().updateEmail(
                          newEmail: emailController.text,
                        );
                    // UserEntity user = UserEntity(
                    //   uId: user2.uId,
                    //   email: emailController.text,
                    //   name: user2.name,
                    //   phone: user2.phone,
                    //   image: user2.image,
                    //   address: user2.address,
                    //   createdAt: user2.createdAt,
                    //   updatedAt: DateTime.now().toIso8601String(),
                    //   status: user2.status,
                    // );
                    // context.read<UserCubit>().editUser(
                    //       user: user,
                    //     );
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
