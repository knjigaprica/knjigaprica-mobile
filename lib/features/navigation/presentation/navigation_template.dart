import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../navigation/presentation/navigation.dart';
import '../application/navigation_provider.dart';

class NavigationTemplate extends StatelessWidget {
  const NavigationTemplate({super.key, required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: SafeArea(
        child: Scaffold(body: body, bottomNavigationBar: const Navigation()),
      ),
    );
  }
}
