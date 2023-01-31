import 'package:flutter/material.dart';

import '../../helpers/constants/color_pallete.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({super.key, required this.controller, this.hint});

  final TextEditingController controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    var getBorder = OutlineInputBorder(
        borderSide: const BorderSide(width: 0, color: Colors.transparent),
        borderRadius: BorderRadius.circular(8));

    return SizedBox(
      child: TextField(
        autofocus: true,
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email_outlined),
            prefixIconColor: ColorPallete.textFieldHintColor,
            fillColor: ColorPallete.textFieldColor,
            filled: true,
            hintText: hint,
            hintStyle: const TextStyle(
                color: ColorPallete.textFieldHintColor, fontSize: 16),
            focusedBorder: getBorder,
            enabledBorder: getBorder),
      ),
    );
  }
}
