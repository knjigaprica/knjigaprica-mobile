import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/books_repository.dart';
import '../home/home_horizontal_book_list.dart';

class RecommendedBooksController extends StatelessWidget {
  RecommendedBooksController({super.key});

  final booksRepo = GetIt.I<BooksRepository>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: booksRepo.getNewestBooks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeHorizontalBookList(
            title: 'Preporučene knjige',
            titleSize: 20,
            books: snapshot.data!
                .map((book) => HomeHorizontalBookListItemModel(
                    id: book.id, imageUrl: book.imageUrl))
                .toList(),
          );
        } else {
          return const HomeHorizontalBookList(
            title: 'Preporučene knjige',
            titleSize: 20,
            isLoading: true,
          );
        }
      },
    );
  }
}
