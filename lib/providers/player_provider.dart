import 'package:flutter/material.dart';

class PlayerBookDetails {
  final String title;
  final String author;

  const PlayerBookDetails({required this.title, required this.author});
}

class PlayerProvider with ChangeNotifier {
  bool _isExpanded = false;
  PlayerBookDetails? _book =
      const PlayerBookDetails(title: 'Tajna Sreće', author: 'Zigfrud Vitver');
  double _speed = 1;

  bool get isExpanded {
    return _isExpanded;
  }

  PlayerBookDetails? get book {
    return _book;
  }

  double get speed {
    return _speed;
  }

  void expand() {
    _isExpanded = true;
    notifyListeners();
  }

  void collapse() {
    _isExpanded = false;
    notifyListeners();
  }

  void setBook({required String title, required String author}) {
    _book = PlayerBookDetails(title: title, author: author);
    notifyListeners();
  }

  void setSpeed(double speed) {
    _speed = speed;
    notifyListeners();
  }
}
