import 'package:flutter/material.dart';

import '../../widgets/shared/my_text_field.dart';
import '../../widgets/shared/primary_button.dart';

class EmailScreen extends StatelessWidget {
  EmailScreen({super.key});

  static const routeName = '/auth-email';

  final _email = TextEditingController();

  void _handleAuthentication() {}

  void _handleClose(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();

      Future.delayed(const Duration(milliseconds: 300)).then((_) {
        Navigator.of(context).pop();
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
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
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Center(
              child: FractionallySizedBox(
            widthFactor: 0.88,
            child: Column(children: [
              FractionallySizedBox(
                widthFactor: 0.4,
                child: Image.asset(
                  'assets/logo/logo-full.png',
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              const Text(
                'Dobrodošli na Knjigapriča platformu',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32,
              ),
              MyTextField(
                controller: _email,
                hint: 'Unesite vaš email',
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                      text: 'Nastavi', onPressed: _handleAuthentication))
            ]),
          )),
        ));
  }
}
