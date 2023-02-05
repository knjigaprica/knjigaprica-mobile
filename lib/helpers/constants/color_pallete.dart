import 'package:flutter/material.dart';

class ColorPallete {
  static const primaryColor = Color(0xFFED505D);
  static const secondaryColor = Color(0xFF0B061D);
  static const errorColor = Color(0xFFF05252);
  static const backgroundColor = Color(0xFFF6F6F7);

  static const appColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ColorPallete.primaryColor,
    onPrimary: Colors.white,
    secondary: ColorPallete.secondaryColor,
    onSecondary: Colors.white,
    error: ColorPallete.errorColor,
    onError: Colors.white,
    background: ColorPallete.backgroundColor,
    onBackground: Colors.black,
    surface: ColorPallete.backgroundColor,
    onSurface: Colors.black,
  );

  static const textFieldBackgroundColor = Colors.white;
  static const textFieldBorderColor = Color(0xFFDBDCE0);
  static const textFieldHintColor = Color(0xFF6B7280);
  static const textFieldFocusedColor = Color(0xFF0B061D);
}
