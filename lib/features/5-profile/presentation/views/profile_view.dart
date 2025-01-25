import 'package:user_online_shop/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/widgets/profile_view_body.dart';
import 'package:user_online_shop/generated/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: S.of(context).profile),
      body: ProfileViewBody(),
    );
  }
}
