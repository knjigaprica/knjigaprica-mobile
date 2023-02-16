import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation.dart';
import '../../providers/navigation_provider.dart';

class MainTemplate extends StatelessWidget {
  const MainTemplate({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Scaffold(
        body: body,
        bottomNavigationBar: const Navigation(),
      ),
    );
  }
}
