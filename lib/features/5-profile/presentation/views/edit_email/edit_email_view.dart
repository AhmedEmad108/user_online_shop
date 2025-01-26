import 'package:flutter/material.dart';
import 'package:user_online_shop/core/widgets/custom_appbar.dart';
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
      body: EditEmailViewBody(),
    );
  }
}