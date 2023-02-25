import 'package:flutter/material.dart';

class PlayerBookDetails {
  final String title;
  final String author;

  const PlayerBookDetails({required this.title, required this.author});
}

enum PlayerState { expanded, collapsed, closed }

class PlayerProvider with ChangeNotifier {
  PlayerState _state = PlayerState.collapsed;
  PlayerBookDetails? _book =
      const PlayerBookDetails(title: 'Tajna Sreće', author: 'Zigfrud Vitver');

  PlayerState get state {
    return _state;
  }

  bool get isExpanded {
    return _state == PlayerState.expanded;
  }

  PlayerBookDetails? get book {
    return _book;
  }

  void expand() {
    _state = PlayerState.expanded;
    notifyListeners();
  }

  void collapse() {
    _state = PlayerState.collapsed;
    notifyListeners();
  }

  void setBook({required String title, required String author}) {
    _book = PlayerBookDetails(title: title, author: author);

    if (_state == PlayerState.closed) {
      _state = PlayerState.collapsed;
    }
    notifyListeners();
  }

  void close() {
    _book = null;
    _state = PlayerState.closed;
    notifyListeners();
  }
}
