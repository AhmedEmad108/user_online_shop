import 'package:user_online_shop/core/utils/app_color.dart';
import 'package:user_online_shop/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.onChecked,
    this.isCheck,
  });
  final ValueChanged<bool> onChecked;
  final bool? isCheck;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    isChecked = widget.isCheck ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChecked(!isChecked);
        isChecked = !isChecked;
        setState(() {});
      },
      child: AnimatedContainer(
        width: 26,
        height: 26,
        duration: const Duration(milliseconds: 200),
        curve: Curves.slowMiddle,
        decoration: ShapeDecoration(
          color: isChecked
              ? AppColor.primaryColor
              : Theme.of(context).colorScheme.tertiary,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1.50,
                color:
                    isChecked ? Colors.transparent : const Color(0xFFDCDEDE)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: isChecked
            ? Padding(
                padding: const EdgeInsets.all(2),
                child: SvgPicture.asset(Assets.imagesCheck),
              )
            : null,
      ),
    );
  }
}
