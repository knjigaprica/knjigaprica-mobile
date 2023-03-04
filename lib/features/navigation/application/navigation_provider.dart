import 'package:flutter/foundation.dart';

enum NavigationItem { home, search, library, profile }

class NavigationProvider with ChangeNotifier {
  NavigationItem _current = NavigationItem.home;

  NavigationItem get current {
    return _current;
  }

  void switchNavigation(NavigationItem item) {
    _current = item;
    notifyListeners();
  }
}
