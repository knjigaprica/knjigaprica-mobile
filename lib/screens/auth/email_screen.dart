import 'package:flutter/material.dart';

import '../../widgets/shared/auth_layout.dart';
import '../../widgets/shared/my_text_field.dart';
import '../../widgets/shared/primary_button.dart';
import 'login_screen.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  static const routeName = '/auth-email';

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final _form = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;
  String? _email;

  void _handleAuthentication(BuildContext context) {
    bool isValid = _form.currentState!.validate();

    if (!isValid) {
      setState(() {
        autoValidateMode = AutovalidateMode.onUserInteraction;
      });
    } else {
      _form.currentState!.save();

      Navigator.of(context).pushNamed(LoginScreen.routeName, arguments: _email);
    }
  }

  @override
  Widget build(BuildContext context) {
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
            'Unesi email',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 32,
          ),
          Form(
              key: _form,
              autovalidateMode: autoValidateMode,
              child: Column(
                children: [
                  MyTextField(
                    validator: (value) {
                      if (value == null ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return "Neispravan email";
                      }
                      return null;
                    },
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (email) {
                      _email = email;
                    },
                    icon: const Icon(Icons.email_outlined),
                    hint: 'Unesi email adresu',
                    onFieldSubmitted: (_) => _handleAuthentication(context),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                          text: 'Nastavi',
                          onPressed: () => _handleAuthentication(context)))
                ],
              ))
        ]),
      )),
    ));
  }
}
