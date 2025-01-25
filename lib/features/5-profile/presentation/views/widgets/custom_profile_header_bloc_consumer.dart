import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user_online_shop/core/cubit/user/user_cubit.dart';
import 'package:user_online_shop/core/helper_functions/get_user.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/widgets/profile_header_item.dart';

class CustomProfileHeaderBlocConsumer extends StatefulWidget {
  const CustomProfileHeaderBlocConsumer({
    super.key,
  });

  @override
  State<CustomProfileHeaderBlocConsumer> createState() =>
      _CustomProfileHeaderBlocConsumerState();
}

class _CustomProfileHeaderBlocConsumerState
    extends State<CustomProfileHeaderBlocConsumer> {
  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getUserData();
  }

  // UserEntity user = getUser();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return ProfileHeaderItem(
            user: state.user,
          );
        }
        if (state is GetUserLoading) {
          return Skeletonizer(
            enabled: true,
            child: ProfileHeaderItem(
              user: getUser(),
            ),
          );
        }
        if (state is GetUserFailed) {
          return Center(child: Text(state.errMessage));
        }
        // ret if (state is GetUserSuccess) {

        // }
        return Skeletonizer(
          enabled: true,
          child: ProfileHeaderItem(
            user: getUser(),
          ),
        );
        // return ProfileHeaderItem(
        //   user: getUser(),
        // );
      },
    );
  }
}
