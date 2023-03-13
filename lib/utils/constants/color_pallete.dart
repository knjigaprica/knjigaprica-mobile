import 'package:flutter/material.dart';

class ColorPallete {
  static const primaryColor = Color(0xFFED505D);
  static const secondaryColor = Color(0xFF0B061D);
  static const errorColor = Color(0xFFE02424);
  static const backgroundColor = Colors.white;

  static const backgroundGradientColor1 = Color(0xFF080415);
  static const backgroundGradientColor2 = Color(0xFF1E153A);

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

  static const miniplayerBorder = Color(0xFFECECEC);
  static const miniplayerBoxShadowColor = Color(0xFFECECEC);
  static const playerAuthorTextColor = Color(0xFF858585);
  static const playerChapterTextColor = Color(0xFF858585);
  static const playerTimeTextColor = Color(0xFFA9A9A9);
  static const playerSliderInactiveColor = Color(0xFFE6E6E6);
  static const playerSpeedButtonColor = Color(0xFFDBDDED);
  static const playerChapterButtonBorderColor = Color(0xFFDCDCDC);
  static const playerSpeedCheckIconColor = Color(0xFF27AE60);
  static const playerChaptersSelectedChapterColor = Color(0xFFE5F5EC);

  static const homeScreenWelcomeSectionDividerColor =
      Color.fromARGB(255, 67, 58, 97);
  static const homeScreenBookShadowColor = Color.fromARGB(255, 221, 219, 219);
  static const homeScreenGenreColor = Color(0xFFEEEEFC);
  static const homeScreenVaucherSecondaryTextColor = Color(0xFF575760);
  static const homeScreenVaucherBackgroundGradientColor1 = Color(0xFFF4ECED);
  static const homeScreenVaucherBackgroundGradientColor2 =
      Color.fromRGBO(252, 247, 247, 0.5);
  static const homeScreenSearchBooksBackgroundGradientColor1 =
      Color(0xFFF4ECED);
  static const homeScreenSearchBooksBackgroundGradientColor2 =
      Color.fromRGBO(252, 247, 247, 0.5);

  static const bookScreenBorderColor = Color(0xFFE7E7E7);
  static const bookScreenImageShadowColor = Color.fromARGB(255, 221, 219, 219);
  static const bookScreenGenreColor = Color(0xFFECEAF0);
}
