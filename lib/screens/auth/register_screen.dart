import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../widgets/shared/auth_template.dart';
import '../../widgets/shared/my_text_field.dart';
import '../../widgets/shared/password_field.dart';
import '../../widgets/shared/primary_button.dart';
import 'register_confirmation_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const routeName = '/auth-register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _form = GlobalKey<FormState>();
  var autoValidateMode = AutovalidateMode.disabled;

  String? _firstName;
  String? _lastName;
  String? _password;

  late TapGestureRecognizer _termsOfUseRecognizer;
  late TapGestureRecognizer _privacyPolicyRecognizer;

  @override
  void initState() {
    super.initState();

    _termsOfUseRecognizer = TapGestureRecognizer()..onTap = () {};
    _privacyPolicyRecognizer = TapGestureRecognizer()..onTap = () {};
  }

  @override
  void dispose() {
    _termsOfUseRecognizer.dispose();
    _privacyPolicyRecognizer.dispose();

    super.dispose();
  }

  void _handleRegister(BuildContext context) {
    bool isValid = _form.currentState!.validate();

    if (!isValid) {
      setState(() {
        autoValidateMode = AutovalidateMode.onUserInteraction;
      });
    } else {
      _form.currentState!.save();

      Navigator.of(context).pushNamed(RegisterConfirmationScreen.routeName,
          arguments: ModalRoute.of(context)!.settings.arguments as String);
    }
  }

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    return AuthTemplate(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 16),
        child: Center(
            child: FractionallySizedBox(
          widthFactor: 0.88,
          child: Column(children: [
            const Text(
              'Kreiraj nalog',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
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
              height: 32,
            ),
            Form(
                key: _form,
                autovalidateMode: autoValidateMode,
                child: Column(
                  children: [
                    MyTextField(
                      validator: (value) => value == null || value.isEmpty
                          ? 'Obavezno polje'
                          : null,
                      onSaved: (value) {
                        _firstName = value;
                      },
                      hint: 'Ime',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MyTextField(
                      validator: (value) => value == null || value.isEmpty
                          ? 'Obavezno polje'
                          : null,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {
                        _lastName = value;
                      },
                      hint: 'Prezime',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PasswordField(
                      validator: (value) => value == null || value.isEmpty
                          ? 'Morate uneti lozinku'
                          : null,
                      hint: 'Lozinka',
                      helperText:
                          '*Lozinka mora sadržati minimalno 8 karaktera',
                      onSaved: (value) {
                        _password = value;
                      },
                      onFieldSubmitted: (_) => _handleRegister(context),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                height: 1.4,
                                fontSize: 14),
                            children: [
                              const TextSpan(
                                text: 'Kreiranjem naloga slažete se sa ',
                              ),
                              TextSpan(
                                  text: 'Uslovima korišćenja',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline)),
                              const TextSpan(
                                text: ' i ',
                              ),
                              TextSpan(
                                  text: 'Politikom privatnosti',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline))
                            ])),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: PrimaryButton(
                            text: 'Kreiraj nalog',
                            onPressed: () => _handleRegister(context)))
                  ],
                ))
          ]),
        )),
      ),
    ));
  }
}
