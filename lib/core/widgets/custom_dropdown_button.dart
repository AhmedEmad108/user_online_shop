import 'package:flutter/material.dart';
import 'package:user_online_shop/core/utils/app_style.dart';

class CustomDropDownList extends StatelessWidget {
  const CustomDropDownList(
      {super.key,
      required this.value,
      required this.list,
      required this.onChanged});
  final String value;
  final List list;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      underline: const SizedBox(),
      borderRadius: BorderRadius.circular(8),
      elevation: 0,
      items: [
        for (var i = 0; i < list.length; i++)
          DropdownMenuItem<String>(
            value: list[i].theme,
            child: Text(
              list[i].name,
              style: AppStyle.styleSemiBold22(),
            ),
          ),
      ],
      onChanged: onChanged,
    );
  }
}
