import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_online_shop/core/services/get_it.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/utils/app_images.dart';
import 'package:user_online_shop/core/widgets/custom_appbar.dart';
import 'package:user_online_shop/core/widgets/custom_dialog.dart';
import 'package:user_online_shop/core/widgets/loading_dialog.dart';
import 'package:user_online_shop/core/widgets/show_snackbar.dart';
import 'package:user_online_shop/features/2-auth/domain/repos/auth_repo.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/edit_email/cubit/edit_email_cubit.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/edit_email/widgets/edit_email_view_body.dart';
import 'package:user_online_shop/generated/l10n.dart';

class EditEmailView extends StatelessWidget {
  const EditEmailView({super.key});
  static const routeName = '/edit-email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context, title: S.of(context).edit_email, icon: true),
      body: BlocProvider(
        create: (context) => EditEmailCubit(
          getIt<AuthRepo>(),
        ),
        child: EditEmailViewBlocConsumer(),
      ),
    );
  }
}

class EditEmailViewBlocConsumer extends StatelessWidget {
  const EditEmailViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditEmailCubit, EditEmailState>(
      listener: (context, state) {
        if (state is EditEmailLoading) {
          loadingDialog(context);
        }
        if (state is EditEmailSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          showSnackBar(
            context,
            S.of(context).email,
            AppColor.green,
          );
        }
        if (state is EditEmailFailed) {
          Navigator.pop(context);
          customDialog(
            context,
            title: state.error,
            image: Assets.imagesErrors,
          );
        }
      },
      builder: (context, state) {
        return EditEmailViewBody();
      },
    );
  }
}
