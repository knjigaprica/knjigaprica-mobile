import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final VoidCallback onPressed;
  final double width;

  const PrimaryButton(
      {super.key,
      this.isLoading = false,
      required this.text,
      required this.onPressed,
      this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 56,
        child: CupertinoButton(
          onPressed: onPressed,
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(84)),
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
