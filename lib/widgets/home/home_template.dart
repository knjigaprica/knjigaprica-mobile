import 'package:flutter/material.dart';

import 'welcome_section.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [WelcomeSection()],
    );
  }
}
