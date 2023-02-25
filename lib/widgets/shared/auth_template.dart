import 'package:flutter/material.dart';

class AuthTemplate extends StatelessWidget {
  const AuthTemplate(
      {super.key, required this.body, this.hasBackButton = true});

  final Widget body;
  final bool hasBackButton;

  void _handleClose(BuildContext context) {
    Navigator.of(context)
        .popUntil((route) => !route.settings.name!.startsWith('/auth'));
  }

  void _handleBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: hasBackButton
              ? IconButton(
                  onPressed: () => _handleBack(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ))
              : null,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                  onPressed: () => _handleClose(context),
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  )),
            )
          ],
        ),
        body: body);
  }
}
