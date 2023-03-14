import 'package:flutter/material.dart';

import '../utils/constants/color_pallete.dart';

enum PlayButtonVariant { primary, darkTone }

class PlayButton extends StatelessWidget {
  const PlayButton(
      {super.key,
      this.size = 48,
      this.variant = PlayButtonVariant.primary,
      this.onPressed});

  final double size;
  final PlayButtonVariant variant;
  final VoidCallback? onPressed;

  Color get getButtonColor {
    switch (variant) {
      case PlayButtonVariant.primary:
        return ColorPallete.primaryColor;
      case PlayButtonVariant.darkTone:
        return ColorPallete.darkTone;
    }
  }

  Color? get getButtonHighlightColor {
    switch (variant) {
      case PlayButtonVariant.primary:
        return ColorPallete.primaryHighlightColor;
      case PlayButtonVariant.darkTone:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: getButtonColor,
        child: InkResponse(
          highlightColor: getButtonHighlightColor,
          splashFactory: NoSplash.splashFactory,
          onTap: onPressed,
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(
              Icons.play_arrow,
              size: size * 0.6,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
