import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/constants/color_pallete.dart';
import './screens/routes.dart';
import 'screens/main_screen.dart';

void main() {
  // Allow only portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Knjigaprica',
        theme: ThemeData(
            fontFamily: Platform.isAndroid ? 'Roboto' : 'SF Pro Display',
            colorScheme: ColorPallete.appColorScheme,
            scaffoldBackgroundColor: ColorPallete.backgroundColor),
        home: const HomeScreen(),
        routes: ApplicationRoutes.getRoutes());
  }
}
