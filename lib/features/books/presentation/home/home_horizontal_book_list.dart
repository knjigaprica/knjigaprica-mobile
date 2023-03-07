import 'package:flutter/material.dart';

import '../../../../common_widgets/skeleton.dart';
import '../book_screen/book_screen_controller.dart';

class HomeHorizontalBookListItemModel {
  final String id;
  final String imageUrl;

  const HomeHorizontalBookListItemModel(
      {required this.id, required this.imageUrl});
}

class HomeHorizontalBookList extends StatelessWidget {
  const HomeHorizontalBookList(
      {super.key,
      required this.title,
      this.isLoading = false,
      this.books = const []});

  final String title;
  final bool isLoading;
  final List<HomeHorizontalBookListItemModel> books;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            title,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 24,
                ),
                if (isLoading)
                  Skeleton(
                      child: Row(
                    children: [
                      ...List.generate(
                        3,
                        (index) => Row(
                          children: [
                            Container(
                              width: 140,
                              height: 210,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                if (!isLoading)
                  ...books.map((book) => Row(children: [
                        SizedBox(
                          width: 140,
                          height: 210,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(BookScreenController.routeName);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(book.imageUrl,
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        )
                      ]))
              ],
            ))
      ],
    );
  }
}
