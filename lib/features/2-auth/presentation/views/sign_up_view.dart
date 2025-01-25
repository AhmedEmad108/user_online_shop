import 'package:user_online_shop/core/services/get_it.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/utils/app_images.dart';
import 'package:user_online_shop/core/widgets/custom_appbar.dart';
import 'package:user_online_shop/core/widgets/custom_dialog.dart';
import 'package:user_online_shop/core/widgets/loading_dialog.dart';
import 'package:user_online_shop/core/widgets/show_snackbar.dart';
import 'package:user_online_shop/features/2-auth/domain/repos/auth_repo.dart';
import 'package:user_online_shop/features/2-auth/presentation/cubit/signup_cubit/sign_up_cubit.dart';
import 'package:user_online_shop/features/2-auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:user_online_shop/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/sign-up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: S.of(context).signup, icon: true),
      body: BlocProvider(
        create: (context) => SignUpCubit(
          getIt<AuthRepo>(),
        ),
        child: SignUpViewBlocConsumer(),
      ),
    );
  }
}

class SignUpViewBlocConsumer extends StatelessWidget {
  const SignUpViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          loadingDialog(context);
        }
        if (state is SignUpSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
          showSnackBar(
            context,
            '${S.of(context).successfully_created_account} ${S.of(context).please_verify_your_email}',
            AppColor.green,
          );
        }
        if (state is SignUpError) {
          Navigator.pop(context);
          customDialog(
            context,
            title: state.message,
            image: Assets.imagesErrors,
          );
        }
      },
      builder: (context, state) {
        return const SignUpViewBody();
      },
    );
  }
}
