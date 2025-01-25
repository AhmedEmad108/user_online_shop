// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key, required this.list, required this.text});
  final List<String> list;
  final TextEditingController text;

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: DropdownButton<String>(
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey,
        ),
        iconSize: 32,
        elevation: 4,
        underline: Container(
          height: 0,
        ),
        items: widget.list.map(buildMenuItem).toList(),
        onChanged: ((value) {
          setState(() {
            widget.text.text = value!;
          });
        }),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
