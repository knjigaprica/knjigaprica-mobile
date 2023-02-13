import 'package:flutter/material.dart';

import '../../screens/auth/register_screen.dart';
import '../../widgets/shared/auth_layout.dart';
import '../../widgets/shared/password_field.dart';
import '../../widgets/shared/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/auth-login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;
  String? _password;

  void _handleLogin(BuildContext context) {
    bool isValid = _form.currentState!.validate();

    if (!isValid) {
      setState(() {
        autoValidateMode = AutovalidateMode.onUserInteraction;
      });
    } else {
      _form.currentState!.save();

      Navigator.of(context).pushNamed(RegisterScreen.routeName,
          arguments: ModalRoute.of(context)!.settings.arguments as String);
    }
  }

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    return AuthLayout(
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
          Form(
              key: _form,
              autovalidateMode: autoValidateMode,
              child: Column(
                children: [
                  PasswordField(
                    validator: (value) => value == null || value.isEmpty
                        ? "Morate uneti lozinku"
                        : null,
                    hint: 'Unesite lozinku',
                    autofocus: true,
                    onSaved: (value) {
                      _password = value;
                    },
                    onFieldSubmitted: (_) => _handleLogin(context),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                          text: 'Prijavi se',
                          onPressed: () => _handleLogin(context)))
                ],
              ))
        ]),
      )),
    ));
  }
}
