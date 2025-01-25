import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/widgets/custom_check_box.dart';
import 'package:user_online_shop/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomTermsAndCondition extends StatefulWidget {
  const CustomTermsAndCondition({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<CustomTermsAndCondition> createState() =>
      _CustomTermsAndConditionState();
}

class _CustomTermsAndConditionState extends State<CustomTermsAndCondition> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isChecked = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          S.of(context).terms_and_condition1,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            S.of(context).terms_and_condition2,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColor.primaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
