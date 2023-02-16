import 'package:flutter/material.dart';

class ColorPallete {
  static const primaryColor = Color(0xFFED505D);
  static const secondaryColor = Color(0xFF0B061D);
  static const errorColor = Color(0xFFE02424);
  static const backgroundColor = Colors.white;

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
  static const textFieldIconColor = Color(0xFFDBDCE0);
  static const textFieldHintColor = Color(0xFF6B7280);
  static const textFieldHelperColor = Color(0xFF6B7280);
  static const textFieldCursorColor = Color(0xFF111928);

  static const textFieldFocusedColor = Color(0xFF0B061D);

  static const textFieldDisabledBorderColor = Color(0xFFDBDCE0);
  static const textFieldDisabledHintColor = Color(0xFF9CA3AF);
  static const textFieldDisabledIconColor = Color(0xFF9CA3AF);
  static const textFieldDisabledBackgroundColor = Color(0xFFFAFAFA);

  static const textFieldErrorBackgroundColor = Color(0xFFFDF2F2);
  static const textFieldErrorIconColor = Color(0xFFF05252);
  static const textFieldErrorBorderColor = Color(0xFFF05252);
  static const textFieldErrorHelperColor = Color(0xFFE02424);

  static const unselectedNavigationItem = Color(0xFFB6B6B6);
  static const navigationTopBorder = Color(0xFFDBDCE0);
}
