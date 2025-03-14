import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_online_shop/contants.dart';
import 'package:user_online_shop/core/helper_functions/get_user.dart';
import 'package:user_online_shop/core/helper_functions/valid_input.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/utils/app_style.dart';
import 'package:user_online_shop/core/widgets/custom_button.dart';
import 'package:user_online_shop/core/widgets/custom_dialog.dart';
import 'package:user_online_shop/core/widgets/custom_text_field.dart';
import 'package:user_online_shop/core/widgets/custome_image_picker_square.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/cubit/becom_seller_cubit.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/models/vender_model.dart';
import 'package:user_online_shop/generated/l10n.dart';

class BecomeSellerViewBody extends StatefulWidget {
  const BecomeSellerViewBody({super.key});

  @override
  State<BecomeSellerViewBody> createState() => _BecomeSellerViewBodyState();
}

class _BecomeSellerViewBodyState extends State<BecomeSellerViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final TextEditingController nameVendorAr = TextEditingController();
  final TextEditingController nameVendorEn = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController phone = TextEditingController();
  String? image, coverImage;
  final user = getUser();

  @override
  void dispose() {
    nameVendorAr.dispose();
    nameVendorEn.dispose();
    address.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Text(
                S.of(context).vendor_message2,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
            CustomeImagePickerSquare(
              onFileChanged: (value) {
                coverImage = value;
              },
              onFileChanged2: (value) {
                image = value;
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  CustomTextField(
                    labels: S.of(context).name_vendor_en,
                    hintText: S.of(context).enter_name_vendor_en,
                    controller: nameVendorEn,
                    validator: (value) {
                      return validInput(
                        context: context,
                        val: nameVendorEn.text,
                        type: 'name',
                        max: 20,
                        min: 5,
                      );
                    },
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labels: S.of(context).name_vendor_ar,
                    hintText: S.of(context).enter_name_vendor_ar,
                    controller: nameVendorAr,
                    validator: (value) {
                      return validInput(
                        context: context,
                        val: nameVendorAr.text,
                        type: 'name',
                        max: 20,
                        min: 5,
                      );
                    },
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labels: S.of(context).phone_vendor,
                    hintText: S.of(context).enter_phone_vendor,
                    controller: phone,
                    validator: (value) {
                      return validInput(
                        context: context,
                        val: phone.text,
                        type: 'phone',
                        max: 20,
                        min: 5,
                      );
                    },
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    labels: S.of(context).vendor_address,
                    hintText: S.of(context).enter_vendor_address,
                    controller: address,
                    validator: (value) {
                      return validInput(
                        context: context,
                        val: address.text,
                        type: 'address',
                        max: 50,
                        min: 5,
                      );
                    },
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    title: S.of(context).become_seller,
                    buttonColor: AppColor.primaryColor,
                    textStyle: AppStyle.styleBold24().copyWith(
                      color: AppColor.white,
                    ),
                    onTap: () {
                      if (image != null && coverImage != null) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context.read<BecomSellerCubit>().becomeSeller(
                                vendor: VendorEntity(
                                  id: user.uId,
                                  nameVendorAr: nameVendorAr.text,
                                  nameVendorEn: nameVendorEn.text,
                                  email: user.email,
                                  phone: phone.text,
                                  address: address.text,
                                  image: image!,
                                  coverImage: coverImage!,
                                  status: 'pending',
                                  createdAt: DateTime.now().toString(),
                                  updatedAt: '',
                                  productIds: [],
                                  settings: {},
                                  rating: 0,
                                  totalOrders: 0,
                                  balance: 0,
                                ),
                              );
                        } else {
                          setState(() {
                            autoValidateMode = AutovalidateMode.always;
                          });
                        }
                      } else {
                        customDialog(
                          context,
                          title: S.of(context).please_select_image,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
