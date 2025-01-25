import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_online_shop/core/cubit/user/user_cubit.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/utils/app_images.dart';
import 'package:user_online_shop/core/widgets/custom_dialog.dart';
import 'package:user_online_shop/core/widgets/loading_dialog.dart';
import 'package:user_online_shop/core/widgets/show_snackbar.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/edit_profile/widgets/edit_profile_view_body.dart';
import 'package:user_online_shop/generated/l10n.dart';

class EditProfileViewBlocConsumer extends StatelessWidget {
  const EditProfileViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is EditUserLoading) {
          loadingDialog(context);
        }
        if (state is EditUserSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          showSnackBar(
            context,
            S.of(context).profile_edited_successfully,
            AppColor.green,
          );
        }
        if (state is EditUserFailed) {
          Navigator.pop(context);
          customDialog(
            context,
            title: state.errMessage,
            image: Assets.imagesErrors,
          );
        }
      },
      builder: (context, state) {
        return EditProfileViewBody();
      },
    );
  }
}
