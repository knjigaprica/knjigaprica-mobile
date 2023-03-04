import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/navigation/application/navigation_provider.dart';
import '../../features/navigation/presentation/navigation_template.dart';
import '../../features/player/application/player_provider.dart';
import '../../features/player/presentation/player_template.dart';
import '../home/home_screen.dart';

class MainTemplate extends StatelessWidget {
  const MainTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlayerProvider(),
      child: NavigationTemplate(body: PlayerTemplate(
        body: Center(
          child: Consumer<NavigationProvider>(
            builder: (context, navigation, child) {
              switch (navigation.current) {
                case NavigationItem.home:
                  return const HomeScreen();
                default:
                  return const Placeholder();
              }
            },
          ),
        ),
      )),
    );
  }
}
