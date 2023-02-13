import 'package:flutter/material.dart';

import '../../screens/auth/register_screen.dart';
import '../../screens/auth/social_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/auth/email_screen.dart';

class ApplicationRoutes {
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      EmailScreen.routeName: (_) => const EmailScreen(),
      LoginScreen.routeName: (_) => const LoginScreen(),
      SocialScreen.routeName: (_) => const SocialScreen(),
      RegisterScreen.routeName: (_) => const RegisterScreen()
    };
  }
}
