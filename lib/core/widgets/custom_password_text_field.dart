import 'package:user_online_shop/core/helper_functions/valid_input.dart';
import 'package:user_online_shop/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    this.onSaved,
    this.text = '',
    required this.hintText,
    required this.label,
    this.controller,
  });

  final void Function(String?)? onSaved;
  final String text, hintText, label;
  final TextEditingController? controller;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: widget.hintText,
      labels: widget.label,
      onSaved: widget.onSaved,
      validator: (value) {
        return validInput(
          context: context,
          val: value!,
          type: 'password',
          max: 20,
          min: 6,
        );
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: isShowPassword,
      suffixIcon: GestureDetector(
        onTap: () {
          isShowPassword = !isShowPassword;
          setState(() {});
        },
        child: isShowPassword
            ? const Icon(Icons.visibility_off_outlined)
            : const Icon(Icons.visibility_outlined),
      ),
    );
  }
}
