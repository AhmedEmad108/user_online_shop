import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_online_shop/core/services/get_it.dart';
import 'package:user_online_shop/core/utils/app_images.dart';
import 'package:user_online_shop/core/widgets/custom_appbar.dart';
import 'package:user_online_shop/core/widgets/custom_dialog.dart';
import 'package:user_online_shop/core/widgets/loading_dialog.dart';
import 'package:user_online_shop/features/2-auth/domain/repos/auth_repo.dart';
import 'package:user_online_shop/features/2-auth/presentation/cubit/signin_cubit/sign_in_cubit.dart';
import 'package:user_online_shop/features/2-auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:user_online_shop/features/3-bottom_nav/presentation/views/main_view.dart';
import 'package:user_online_shop/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static const routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: S.of(context).signin),
      body: BlocProvider(
        create: (context) => SignInCubit(
          getIt<AuthRepo>(),
        ),
        child: SignInViewBlocConsumer(),
      ),
    );
  }
}

class SignInViewBlocConsumer extends StatelessWidget {
  const SignInViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          loadingDialog(context);
        }
        if (state is SignInSuccess) {
          Navigator.pop(context);
          Navigator.of(context).pushNamedAndRemoveUntil(
            MainView.routeName,
            (route) => false,
          );
        }
        if (state is SignInError) {
          Navigator.pop(context);
          customDialog(
            context,
            title: state.message,
            image: Assets.imagesErrors,
          );
        }
      },
      builder: (context, state) {
        return SignInViewBody();
      },
    );
  }
}
