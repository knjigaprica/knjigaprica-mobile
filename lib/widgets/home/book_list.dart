import 'package:flutter/material.dart';

import '../../widgets/home/data_section.dart';
import '../../helpers/constants/color_pallete.dart';

class BookListModel {
  final String title;
  final String author;
  final String imageUrl;

  const BookListModel(
      {required this.title, required this.author, required this.imageUrl});
}

class BookList extends StatelessWidget {
  const BookList({super.key, required this.title, this.books = const []});

  final String title;
  final List<BookListModel> books;

  @override
  Widget build(BuildContext context) {
    return DataSection(
        title: title,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 24,
                ),
                ...books.map((book) => Row(children: [
                      _Book(
                          title: book.title,
                          author: book.author,
                          imageUrl: book.imageUrl),
                      const SizedBox(
                        width: 24,
                      )
                    ]))
              ],
            )));
  }
}

class _Book extends StatelessWidget {
  const _Book(
      {required this.title, required this.author, required this.imageUrl});

  final String title;
  final String author;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 140,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 206,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              author,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: ColorPallete.homeScreenBookAuthorColor),
            ),
          ],
        ));
  }
}
