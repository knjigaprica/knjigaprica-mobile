import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/color_pallete.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(
      {super.key,
      this.controller,
      this.hint,
      this.validator,
      this.onSaved,
      this.helperText,
      this.onFieldSubmitted,
      this.autofocus = false});

  final TextEditingController? controller;
  final String? hint;
  final String? helperText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final bool autofocus;
  final void Function(String)? onFieldSubmitted;

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

  InputBorder _buildBorder(Color color, double width) {
    return OutlineInputBorder(
        borderSide: BorderSide(width: width, color: color),
        borderRadius: BorderRadius.circular(8));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        autofocus: widget.autofocus,
        onFieldSubmitted: widget.onFieldSubmitted,
        keyboardType: TextInputType.text,
        onSaved: widget.onSaved,
        obscureText: !_visible,
        controller: widget.controller,
        validator: widget.validator,
        cursorColor: ColorPallete.textFieldCursorColor,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: _getVisibilityIcon(),
              onPressed: _switchVisibility,
              splashColor: Colors.transparent),
          suffixIconColor: ColorPallete.textFieldFocusedColor,
          fillColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.error)) {
              return ColorPallete.textFieldErrorBackgroundColor;
            } else {
              return ColorPallete.textFieldBackgroundColor;
            }
          }),
          filled: true,
          hintText: widget.hint,
          errorStyle: const TextStyle(
              color: ColorPallete.textFieldErrorHelperColor,
              fontWeight: FontWeight.w600),
          helperStyle:
              const TextStyle(color: ColorPallete.textFieldHelperColor),
          helperText: widget.helperText,
          hintStyle: const TextStyle(
              color: ColorPallete.textFieldHintColor, fontSize: 16),
          errorBorder: _buildBorder(ColorPallete.textFieldErrorBorderColor, 2),
          focusedBorder: _buildBorder(ColorPallete.textFieldFocusedColor, 2),
          focusedErrorBorder:
              _buildBorder(ColorPallete.textFieldErrorBorderColor, 2),
          enabledBorder: _buildBorder(ColorPallete.textFieldBorderColor, 1),
        ),
      ),
    );
  }
}
