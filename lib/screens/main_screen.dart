import 'package:flutter/material.dart';

import '../widgets/shared/main_template.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainTemplate(
      body: Center(child: Text('Main screen')),
    );
  }
}
