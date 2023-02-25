import 'package:flutter/material.dart';

import '../../widgets/player/player_template.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PlayerTemplate(
        body: Center(
      child: Center(child: Text('Home page')),
    ));
  }
}
