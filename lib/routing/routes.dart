import 'package:flutter/material.dart';

import '../features/auth/presentation/email_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/register_confirmation_screen.dart';
import '../features/auth/presentation/register_screen.dart';
import '../features/auth/presentation/social_screen.dart';
import '../features/auth/presentation/welcome_screen.dart';
import '../features/books/presentation/book_screen/book_screen_controller.dart';

class ApplicationRoutes {
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      EmailScreen.routeName: (_) => const EmailScreen(),
      LoginScreen.routeName: (_) => const LoginScreen(),
      SocialScreen.routeName: (_) => const SocialScreen(),
      RegisterScreen.routeName: (_) => const RegisterScreen(),
      RegisterConfirmationScreen.routeName: (_) =>
          const RegisterConfirmationScreen(),
      WelcomeScreen.routeName: (_) => const WelcomeScreen(),
      BookScreenController.routeName: (_) => BookScreenController()
    };
  }
}
