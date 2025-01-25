import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    required this.title,
    required this.buttonColor,
    required this.textStyle,
    this.width = double.infinity,
    this.height = 54,
  });
  final void Function()? onTap;
  final String title;
  final Color buttonColor;
  final TextStyle textStyle;
  final double width, height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
