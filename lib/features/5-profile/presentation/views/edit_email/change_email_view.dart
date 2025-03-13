import 'package:flutter/material.dart';
import 'package:user_online_shop/core/widgets/custom_appbar.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/edit_email/widgets/change_email_view_bloc_consumer.dart';
import 'package:user_online_shop/generated/l10n.dart';

class ChangeEmailView extends StatelessWidget {
  const ChangeEmailView({super.key});
  static const routeName = '/change-email';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customAppBar(context, title: S.of(context).change_email, icon: true),
      body: ChangeEmailViewBlocConsumer(),
    );
  }
}
