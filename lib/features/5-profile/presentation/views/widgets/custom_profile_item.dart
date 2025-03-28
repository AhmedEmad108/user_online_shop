import 'package:flutter/material.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/become_seller_view.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/chang_password/change_password_view.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/edit_email/change_email_view.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/edit_profile/edit_profile_view.dart';
import 'package:user_online_shop/generated/l10n.dart';
import 'package:user_online_shop/core/widgets/custom_listtile.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/logout/custom_log_out.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/widgets/custom_change_lang_item.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/widgets/custom_change_theme_item.dart';

class CustomProfileItem extends StatelessWidget {
  const CustomProfileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          CustomListTile(
            title: S.of(context).edit_profile,
            icon: Icons.edit_outlined,
            onTap: () {
              Navigator.of(context).pushNamed(
                EditProfileView.routeName,
              );
            },
          ),
          CustomListTile(
            title: S.of(context).change_email,
            icon: Icons.email_outlined,
            onTap: () {
              Navigator.of(context).pushNamed(
                ChangeEmailView.routeName,
              );
            },
          ),
          CustomListTile(
            title: S.of(context).change_password,
            icon: Icons.lock_outline,
            onTap: () {
              Navigator.of(context).pushNamed(
                ChangePasswordView.routeName,
              );
            },
          ),
          CustomListTile(
            title: S.of(context).become_seller,
            icon: Icons.store_outlined,
            onTap: () {
              Navigator.of(context).pushNamed(
                BecomeSellerView.routeName,
              );
            },
          ),
          const CustomChangeThemeItem(),
          const CustomChangeLangItem(),
          const CustomLogOut(),
        ],
      ),
    );
  }
}
