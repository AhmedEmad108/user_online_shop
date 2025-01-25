import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.color = AppColor.primaryColor,
    this.trailing,
  });
  final String title;
  final IconData icon;
  final void Function()? onTap;
  final Color? color;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            icon,
            color: color,
            size: 30,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: trailing ??
              const Icon(
                Icons.chevron_right,
                color: AppColor.primaryColor,
                size: 30,
              ),
          onTap: onTap,
        ),
        Divider(
          color: Theme.of(context).colorScheme.secondary,
          thickness: 1,
        ),
      ],
    );
  }
}
