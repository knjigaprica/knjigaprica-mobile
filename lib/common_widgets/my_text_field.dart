import 'package:flutter/material.dart';

import '../utils/constants/color_pallete.dart';

class MyTextField extends StatefulWidget {
  const MyTextField(
      {super.key,
      this.controller,
      this.hint,
      this.icon,
      this.keyboardType,
      this.onSaved,
      this.validator,
      this.helperText,
      this.onFieldSubmitted,
      this.autofocus = false});

  final TextEditingController? controller;
  final String? hint;
  final String? helperText;
  final Icon? icon;
  final TextInputType? keyboardType;
  final bool autofocus;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool _isEmpty = true;

  void _handleOnChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        _isEmpty = true;
      } else {
        _isEmpty = false;
      }
    });
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
          keyboardType: widget.keyboardType,
          onSaved: widget.onSaved,
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: _handleOnChanged,
          validator: widget.validator,
          controller: widget.controller,
          cursorColor: ColorPallete.textFieldCursorColor,
          decoration: InputDecoration(
              prefixIcon: widget.icon,
              prefixIconColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.error)) {
                  return ColorPallete.textFieldErrorIconColor;
                } else if (states.contains(MaterialState.disabled)) {
                  return ColorPallete.textFieldDisabledIconColor;
                } else if (states.contains(MaterialState.focused)) {
                  return ColorPallete.textFieldFocusedColor;
                } else if (!_isEmpty) {
                  return ColorPallete.textFieldFocusedColor;
                } else {
                  return ColorPallete.textFieldIconColor;
                }
              }),
              fillColor: MaterialStateColor.resolveWith((states) {
                if (states.contains(MaterialState.error)) {
                  return ColorPallete.textFieldErrorBackgroundColor;
                } else if (states.contains(MaterialState.disabled)) {
                  return ColorPallete.textFieldDisabledBackgroundColor;
                } else {
                  return ColorPallete.textFieldBackgroundColor;
                }
              }),
              filled: true,
              hintText: widget.hint,
              errorStyle: const TextStyle(
                  color: ColorPallete.textFieldErrorHelperColor,
                  fontWeight: FontWeight.w600),
              helperText: widget.helperText,
              helperStyle:
                  const TextStyle(color: ColorPallete.textFieldHelperColor),
              hintStyle: MaterialStateTextStyle.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return const TextStyle(
                      color: ColorPallete.textFieldDisabledHintColor);
                } else {
                  return const TextStyle(
                      color: ColorPallete.textFieldHintColor);
                }
              }),
              errorBorder:
                  _buildBorder(ColorPallete.textFieldErrorBorderColor, 2),
              focusedBorder:
                  _buildBorder(ColorPallete.textFieldFocusedColor, 2),
              focusedErrorBorder:
                  _buildBorder(ColorPallete.textFieldErrorBorderColor, 2),
              enabledBorder: _buildBorder(ColorPallete.textFieldBorderColor, 1),
              disabledBorder:
                  _buildBorder(ColorPallete.textFieldDisabledBorderColor, 1))),
    );
  }
}
