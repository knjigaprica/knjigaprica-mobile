import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/constants/color_pallete.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? hint;

  const PasswordField({super.key, required this.controller, this.hint});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _visible = false;

  void _switchVisibility() {
    setState(() {
      _visible = !_visible;
    });
  }

  Icon _getVisibilityIcon() {
    return Icon(_visible ? CupertinoIcons.eye : CupertinoIcons.eye_slash);
  }

  InputBorder _getBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(width: 0, color: Colors.transparent),
        borderRadius: BorderRadius.circular(8));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        obscureText: !_visible,
        controller: widget.controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                icon: _getVisibilityIcon(),
                onPressed: _switchVisibility,
                splashColor: Colors.transparent),
            suffixIconColor: ColorPallete.textFieldHintColor,
            fillColor: ColorPallete.textFieldColor,
            filled: true,
            hintText: widget.hint,
            hintStyle: const TextStyle(
                color: ColorPallete.textFieldHintColor, fontSize: 16),
            focusedBorder: _getBorder(),
            enabledBorder: _getBorder()),
      ),
    );
  }
}
