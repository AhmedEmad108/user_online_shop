import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_online_shop/contants.dart';
import 'package:user_online_shop/core/cubit/change_password/change_password_cubit.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/utils/app_style.dart';
import 'package:user_online_shop/core/widgets/custom_button.dart';
import 'package:user_online_shop/core/widgets/custom_dialog.dart';
import 'package:user_online_shop/core/widgets/custom_password_text_field.dart';
import 'package:user_online_shop/generated/l10n.dart';

class ChangePasswordViewBody extends StatefulWidget {
  const ChangePasswordViewBody({super.key});

  @override
  State<ChangePasswordViewBody> createState() => _ChangePasswordViewBodyState();
}

class _ChangePasswordViewBodyState extends State<ChangePasswordViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String currentPassword = '';
  String newPassword = '';
  String confirmNewPassword = '';
  // TextEditingController currentPassword = TextEditingController();
  // TextEditingController newPassword = TextEditingController();
  // TextEditingController confirmNewPass = TextEditingController();

  @override
  void dispose() {
    // currentPassword.dispose();
    // newPassword.dispose();
    // confirmNewPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autoValidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                S.of(context).your_new_password,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      height: 1.5,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomPasswordTextField(
                onSaved: (value) {
                  currentPassword = value!;
                },
                label: S.of(context).current_password,
                hintText: S.of(context).enter_current_password,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomPasswordTextField(
                onSaved: (value) {
                  newPassword = value!;
                },
                label: S.of(context).new_password,
                hintText: S.of(context).enter_new_password,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomPasswordTextField(
                onSaved: (value) {
                  confirmNewPassword = value!;
                },
                label: S.of(context).confirm_new_password,
                hintText: S.of(context).enter_confirm_new_password,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                title: S.of(context).change_password,
                buttonColor: AppColor.primaryColor,
                textStyle: AppStyle.styleBold24().copyWith(
                  color: AppColor.white,
                ),
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (newPassword == confirmNewPassword) {
                      context.read<ChangePasswordCubit>().changePassword2(
                            currentPassword: currentPassword,
                            newPassword: newPassword,
                          );
                      // await context.read<ChangePasswordCubit>().changePassword(
                      //       currentPassword: currentPassword.text,
                      //       newPassword: newPassword.text,
                      //     );
                    } else {
                      customDialog(
                        context,
                        title: 'Password and confirm password not match',
                      );
                    }
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
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
