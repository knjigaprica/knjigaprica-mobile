import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/books_repository.dart';
import 'book_screen.dart';
import 'skeleton_book_screen.dart';

class BookScreenController extends StatelessWidget {
  BookScreenController({super.key});

  static const routeName = '/book';

  final booksRepo = GetIt.I<BooksRepository>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: booksRepo.getBook('1'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const BookScreen();
        } else {
          return const SkeletonBookScreen();
        }
      },
    );
  }
}
