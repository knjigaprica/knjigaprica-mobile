import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/books_repository.dart';
import '../shared/horizontal_book_list.dart';

class RecommendedBooksController extends StatelessWidget {
  RecommendedBooksController({super.key});

  final booksRepo = GetIt.I<BooksRepository>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: booksRepo.getNewestBooks(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HorizontalBookList(
            title: 'Preporučene knjige',
            titleSize: 20,
            books: snapshot.data!
                .map((book) => HorizontalBookListItemModel(
                    id: book.id, imageUrl: book.imageUrl))
                .toList(),
          );
        } else {
          return const HorizontalBookList(
            title: 'Preporučene knjige',
            titleSize: 20,
            isLoading: true,
          );
        }
      },
    );
  }
}
