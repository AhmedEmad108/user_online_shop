import 'package:flutter/material.dart';
import 'package:user_online_shop/core/widgets/custom_appbar.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/edit_profile/widgets/edit_profile_view_bloc_consumer.dart';
import 'package:user_online_shop/generated/l10n.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});
  static const routeName = 'EditProfileView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context, title: S.of(context).edit_profile, icon: true),
      body: EditProfileViewBlocConsumer(),
    );
  }
}
