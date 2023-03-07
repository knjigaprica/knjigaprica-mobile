import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../features/books/data/books_repository.dart';
import '../../features/books/presentation/home/home_horizontal_book_list.dart';

class NewestBooksController extends StatelessWidget {
  NewestBooksController({super.key});

  final booksRepo = GetIt.I<BooksRepository>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: booksRepo.getNewestBooks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeHorizontalBookList(
            title: 'Najnovije',
            books: snapshot.data!
                .map((book) => HomeHorizontalBookListItemModel(
                    id: book.id, imageUrl: book.imageUrl))
                .toList(),
          );
        } else {
          return const HomeHorizontalBookList(
            title: 'Najnovije',
            isLoading: true,
          );
        }
      },
    );
  }
}
