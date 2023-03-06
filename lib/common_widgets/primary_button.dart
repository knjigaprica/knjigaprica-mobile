import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double borderRadius;

  const PrimaryButton(
      {super.key,
      this.isLoading = false,
      required this.text,
      required this.onPressed,
      this.width = double.infinity,
      this.borderRadius = 84});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: 56,
        child: CupertinoButton(
          onPressed: onPressed,
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          pressedOpacity: 0.9,
          child: isLoading
              ? const FittedBox(
                  child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ))
              : Text(text),
        ));
  }
}
