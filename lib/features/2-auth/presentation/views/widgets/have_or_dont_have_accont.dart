import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class HaveOrDontHaveAccont extends StatelessWidget {
  const HaveOrDontHaveAccont(
      {super.key, required this.text, required this.text2, this.onTap});
  final String text, text2;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          //  AppStyle.styleSemiBold22(),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text2,
            style: AppStyle.styleSemiBold22().copyWith(
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ],
    );
   }
}
