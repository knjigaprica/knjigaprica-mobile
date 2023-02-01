import 'package:flutter/material.dart';

import '../../screens/auth/login_screen.dart';
import '../../screens/auth/email_screen.dart';

class ApplicationRoutes {
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {
      EmailScreen.routeName: (context) => EmailScreen(),
      LoginScreen.routeName: (context) => LoginScreen()
    };
  }
}
