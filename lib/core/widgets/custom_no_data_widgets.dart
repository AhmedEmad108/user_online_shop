import 'package:flutter/material.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/generated/l10n.dart';

class CustomNoDataWidget extends StatelessWidget {
  const CustomNoDataWidget({
    super.key, required this.message,
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.category_outlined,
            size: 64,
            color: AppColor.lightPrimaryColor,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            S
                .of(context)
                .pull_to_refresh, // إضافة نص يشير إلى إمكانية السحب للتحديث
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
        ],
      ),
    );
  }
}
