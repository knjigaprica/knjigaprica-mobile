import 'package:flutter/material.dart';

import '../../widgets/shared/password_field.dart';
import '../../widgets/shared/primary_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const routeName = '/login';

  final _passwordController = TextEditingController();

  void _handleLogin() {}

  void _handleBackNavigation(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => _handleBackNavigation(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                  onPressed: () {},
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
                widthFactor: 0.5,
                child: Image.asset(
                  'assets/logo/logo-full.png',
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              const Text(
                'Prijavite se',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                email,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              PasswordField(
                controller: _passwordController,
                hint: 'Unesite lozinku',
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                      text: 'Prijavi se', onPressed: _handleLogin))
            ]),
          )),
        ));
  }
}
