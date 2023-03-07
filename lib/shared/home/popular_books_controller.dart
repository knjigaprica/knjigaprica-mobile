import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../features/books/data/books_repository.dart';
import '../../features/books/presentation/home/home_horizontal_book_list.dart';

class PopularBooksController extends StatelessWidget {
  PopularBooksController({super.key});

  final booksRepo = GetIt.I<BooksRepository>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: booksRepo.getPopularBooks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeHorizontalBookList(
            title: 'Najpopularnije',
            books: snapshot.data!
                .map((book) => HomeHorizontalBookListItemModel(
                    id: book.id, imageUrl: book.imageUrl))
                .toList(),
          );
        } else {
          return const HomeHorizontalBookList(
            title: 'Najpopularnije',
            isLoading: true,
          );
        }
      },
    );
  }
}
