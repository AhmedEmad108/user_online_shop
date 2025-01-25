import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:user_online_shop/core/utils/app_color.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.text, required this.image});

  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.onSurface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: ShapeDecoration(
                color: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(
                  child: SvgPicture.asset(
                image,
                width: 24,
                height: 24,
                color: Theme.of(context).colorScheme.onPrimary,
              )),
            ),
            const SizedBox(
              width: 4,
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColor.primaryColor),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
