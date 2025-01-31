import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_online_shop/core/cubit/user/user_cubit.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/utils/app_images.dart';
import 'package:user_online_shop/core/widgets/custom_dialog.dart';
import 'package:user_online_shop/core/widgets/loading_dialog.dart';
import 'package:user_online_shop/core/widgets/show_snackbar.dart';
import 'package:user_online_shop/features/2-auth/presentation/views/sign_in_view.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/edit_email/widgets/change_email_view_body.dart';
import 'package:user_online_shop/generated/l10n.dart';

class ChangeEmailViewBlocConsumer extends StatelessWidget {
  const ChangeEmailViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is ChangeEmailLoading) {
          Navigator.pop(context);
          loadingDialog(context);
        }
        if (state is ChangeEmailSuccess) {
          Navigator.pop(context);
          FirebaseAuth.instance.signOut().then((value) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                SignInView.routeName, (route) => false);
          });
          showSnackBar(
            context,
            S.of(context).please_verify_your_email,
            AppColor.green,
          );
        }
        if (state is ChangeEmailFailed) {
          Navigator.pop(context);
          customDialog(
            context,
            title: state.error,
            image: Assets.imagesErrors,
          );
        }
      },
      builder: (context, state) {
        return ChangeEmailViewBody();
      },
    );
  }
}
