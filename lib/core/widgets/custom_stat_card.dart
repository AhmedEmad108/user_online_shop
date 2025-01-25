import 'package:flutter/material.dart';
import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/widgets/stat_item.dart';

class CustomStatCard extends StatelessWidget {
  const CustomStatCard({
    super.key,
    required this.activeCount,
    required this.inactiveCount,
    required this.activeLabel,
    required this.inactiveLabel,
    required this.addLabel,
    this.onTap,
  });

  final int activeCount;
  final int inactiveCount;
  final String activeLabel, inactiveLabel, addLabel;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Theme.of(context).colorScheme.tertiary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StatItem(
                  icon: Icons.check_circle_outline,
                  color: Colors.green,
                  count: activeCount,
                  label: activeLabel,
                ),
                Container(
                  width: 1,
                  height: 40,
                  color: Colors.grey.withOpacity(0.3),
                ),
                StatItem(
                  icon: Icons.cancel_outlined,
                  color: Colors.red,
                  count: inactiveCount,
                  label: inactiveLabel,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onTap,
          child: Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Theme.of(context).colorScheme.tertiary,
            child: StatItem(
              icon: Icons.add,
              color: AppColor.primaryColor,
              label: addLabel,
            ),
          ),
        ),
      ],
    );
  }
}
