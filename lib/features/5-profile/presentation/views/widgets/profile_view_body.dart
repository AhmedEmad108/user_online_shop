import 'package:user_online_shop/contants.dart';
import 'package:flutter/material.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/widgets/custom_profile_header.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/widgets/custom_profile_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomProfileHeader(),
            const CustomProfileItem(),
          ],
        ),
      ),
    );
  }
}
