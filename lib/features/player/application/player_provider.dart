import 'package:flutter/material.dart';

import '../domain/player_book.dart';
import '../domain/player_book_chapter.dart';

class PlayerProvider with ChangeNotifier {
  bool _isExpanded = false;

  late PlayerBook _book =
      PlayerBook(title: 'Tajna Sreće', author: 'Zigfrud Vitver', chapters: [
    PlayerBookChapter(
        id: '1',
        name: 'Opening Credits',
        duration: const Duration(seconds: 13)),
    PlayerBookChapter(
        id: '2',
        name: 'Preface to the Second Edition',
        duration: const Duration(minutes: 3, seconds: 43)),
    PlayerBookChapter(
        id: '3',
        name: 'About This Book',
        duration: const Duration(minutes: 4, seconds: 32)),
    PlayerBookChapter(
        id: '4',
        name: "Why This Book Is Unlike Any Book You've Ever Read",
        duration: const Duration(minutes: 8, seconds: 55)),
    PlayerBookChapter(
        id: '5', name: 'Career', duration: const Duration(seconds: 54)),
    PlayerBookChapter(
        id: '6',
        name: 'Treat Your Career Like a Business',
        duration: const Duration(minutes: 5, seconds: 58)),
    PlayerBookChapter(
        id: '7',
        name: 'How To Set Good Career Goals',
        duration: const Duration(minutes: 7, seconds: 18)),
    PlayerBookChapter(
        id: '8',
        name: 'Developing Your People Skills',
        duration: const Duration(minutes: 11, seconds: 32)),
    PlayerBookChapter(
        id: '9',
        name: 'Creating an Effective Resume',
        duration: const Duration(minutes: 8, seconds: 52)),
    PlayerBookChapter(
        id: '10',
        name:
            'How to Hack the Job Interview and get a hight paid job and become a milionare',
        duration: const Duration(hours: 2, minutes: 14, seconds: 34))
  ]);

  double _speed = 1;
  late String _selectedChapterId = '1';

  bool get isExpanded {
    return _isExpanded;
  }

  PlayerBook get book {
    return _book;
  }

  double get speed {
    return _speed;
  }

  String get selectedChapterId {
    return _selectedChapterId;
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
    _book = PlayerBook(title: title, author: author, chapters: []);
    notifyListeners();
  }

  void setChapter({required String id}) {
    _selectedChapterId = id;
    notifyListeners();
  }

  void setSpeed(double speed) {
    _speed = speed;
    notifyListeners();
  }
}
