import 'package:flutter/material.dart';

import '../../widgets/shared/primary_button.dart';
import '../../widgets/shared/my_text_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              child: Row(
                children: [
                  const Expanded(
                    flex: 5,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Slušaj svoje omiljene knjige, bilo kada, bilo gde.",
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text(
                          "Knjigapriča je prva online platforma za audio knjige na srpskom jeziku.",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        PrimaryButton(
                            text: "Prijavi se / Kreiraj nalog",
                            onPressed: () {}),
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
                  const Expanded(
                    flex: 5,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
