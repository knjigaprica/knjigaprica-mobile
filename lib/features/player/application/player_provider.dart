import 'package:flutter/material.dart';

class PlayerProvider with ChangeNotifier {
  bool _isExpanded = false;
  PlayerBookDetails? _book = PlayerBookDetails(
      title: 'Tajna Sreće',
      author: 'Zigfrud Vitver',
      chapters: [
        PlayerBookChapter(
            name: 'Opening Credits', length: const Duration(seconds: 13)),
        PlayerBookChapter(
            name: 'Preface to the Second Edition',
            length: const Duration(minutes: 3, seconds: 43)),
        PlayerBookChapter(
            name: 'About This Book',
            length: const Duration(minutes: 4, seconds: 32)),
        PlayerBookChapter(
            name: "Why This Book Is Unlike Any Book You've Ever Read",
            length: const Duration(minutes: 8, seconds: 55)),
        PlayerBookChapter(name: 'Career', length: const Duration(seconds: 54)),
        PlayerBookChapter(
            name: 'Treat Your Career Like a Business',
            length: const Duration(minutes: 5, seconds: 58)),
        PlayerBookChapter(
            name: 'How To Set Good Career Goals',
            length: const Duration(minutes: 7, seconds: 18)),
        PlayerBookChapter(
            name: 'Developing Your People Skills',
            length: const Duration(minutes: 11, seconds: 32)),
        PlayerBookChapter(
            name: 'Creating an Effective Resume',
            length: const Duration(minutes: 8, seconds: 52)),
        PlayerBookChapter(
            name: 'How to Hack the Job Interview',
            length: const Duration(minutes: 14, seconds: 34))
      ]);
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

class PlayerBookDetails {
  final String title;
  final String author;
  final List<PlayerBookChapter> chapters;

  const PlayerBookDetails(
      {required this.title, required this.author, this.chapters = const []});
}

class PlayerBookChapter {
  final String name;
  final Duration length;

  PlayerBookChapter({required this.name, required this.length});
}
