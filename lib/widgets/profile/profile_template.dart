import 'package:flutter/material.dart';

import '../../screens/auth/welcome_screen.dart';

class ProfileTemplate extends StatelessWidget {
  const ProfileTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Profil'),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(WelcomeScreen.routeName);
            },
            child: const Text('Idi na dobrodošli'))
      ],
    );
  }
}
