import 'package:flutter/material.dart';

import '../../helpers/constants/color_pallete.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      this.hint,
      this.icon,
      this.keyboardType,
      this.onSubmitted});

  final TextEditingController controller;
  final String? hint;
  final Icon? icon;
  final TextInputType? keyboardType;
  final void Function(String)? onSubmitted;

  InputBorder _getBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(width: 0, color: Colors.transparent),
        borderRadius: BorderRadius.circular(8));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        keyboardType: keyboardType,
        onSubmitted: onSubmitted,
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            prefixIcon: icon,
            prefixIconColor: ColorPallete.textFieldHintColor,
            fillColor: ColorPallete.textFieldColor,
            filled: true,
            hintText: hint,
            hintStyle: const TextStyle(
                color: ColorPallete.textFieldHintColor, fontSize: 16),
            focusedBorder: _getBorder(),
            enabledBorder: _getBorder()),
      ),
    );
  }
}
