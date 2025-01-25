import 'package:flutter/material.dart';

class StatItem extends StatelessWidget {
  final IconData icon;
  final Color color;
  final int? count;
  final String label;

  const StatItem({
    super.key,
    required this.icon,
    required this.color,
    this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 24),
              if (count != null) const SizedBox(width: 8),
              if (count != null)
                Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 20,
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              if (count == null) const SizedBox(height: 36),
            ],
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12,
                ),
          ),
        ],
      ),
    );
  }
}
