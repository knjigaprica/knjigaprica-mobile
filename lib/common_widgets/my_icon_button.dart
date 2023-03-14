import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  const MyIconButton(
      {super.key, this.size = 48, required this.icon, this.onPressed});

  final double size;
  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkResponse(
          splashFactory: NoSplash.splashFactory,
          onTap: onPressed,
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(
              icon,
              size: size * 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
