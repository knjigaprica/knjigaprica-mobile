import 'package:flutter/material.dart';

import '../../screens/auth/email_screen.dart';

class ApplicationRoutes {
  static Map<String, Widget Function(BuildContext)> getRoutes() {
    return {EmailScreen.routeName: (context) => EmailScreen()};
  }
}
