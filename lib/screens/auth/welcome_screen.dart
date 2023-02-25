import 'package:flutter/material.dart';

import '../../screens/auth/social_screen.dart';
import '../../widgets/shared/primary_button.dart';
import '../../widgets/shared/my_text_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const routeName = '/welcome';

  void _handleContinue(BuildContext context) {
    Navigator.of(context).pushNamed(SocialScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/images/welcome-books.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Slušaj svoje omiljene knjige, bilo kada, bilo gde.',
                      style:
                          TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Knjigapriča je prva online platforma za audio knjige na srpskom jeziku.',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    PrimaryButton(
                        text: 'Prijavi se / Kreiraj nalog',
                        onPressed: () => _handleContinue(context)),
                    const SizedBox(
                      height: 12,
                    ),
                    MyTextButton(
                      text: 'Isprobaj besplatno',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
