import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_online_shop/core/cubit/signout_cubit/sign_out_cubit.dart';
import 'package:user_online_shop/core/services/get_it.dart';
import 'package:user_online_shop/core/utils/app_images.dart';
import 'package:user_online_shop/core/widgets/custom_dialog.dart';
import 'package:user_online_shop/core/widgets/loading_dialog.dart';
import 'package:user_online_shop/features/2-auth/domain/repos/auth_repo.dart';
import 'package:user_online_shop/features/2-auth/presentation/views/sign_in_view.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/logout/custom_log_out_item.dart';

class CustomLogOutBlocConsumer extends StatelessWidget {
  const CustomLogOutBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignOutCubit(getIt<AuthRepo>()),
      child: BlocConsumer<SignOutCubit, SignOutState>(
        listener: (context, state) {
          if (state is SignOutLoading) {
            loadingDialog(context);
          }
          if (state is SignOutSuccess) {
            Navigator.pop(context);
            Navigator.of(context).pushNamedAndRemoveUntil(
                SignInView.routeName, (route) => false);
          }
          if (state is SignOutError) {
            Navigator.pop(context);
            customDialog(
              context,
              title: state.message,
              image: Assets.imagesErrors,
            );
          }
        },
        builder: (context, state) {
          return CustomLogOutItem();
        },
      ),
    );
  }
}
