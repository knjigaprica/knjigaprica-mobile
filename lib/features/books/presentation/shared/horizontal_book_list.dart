import 'package:flutter/material.dart';

import '../../../../common_widgets/skeleton.dart';
import '../../../../utils/constants/color_pallete.dart';
import '../book_screen/book_screen_controller.dart';

class HorizontalBookListItemModel {
  final String id;
  final String imageUrl;

  const HorizontalBookListItemModel({required this.id, required this.imageUrl});
}

class HorizontalBookList extends StatelessWidget {
  const HorizontalBookList(
      {super.key,
      required this.title,
      this.isLoading = false,
      this.books = const [],
      this.titleSize = 24});

  final String title;
  final bool isLoading;
  final List<HorizontalBookListItemModel> books;
  final double titleSize;

  static const double bookWidth = 137;
  static const double bookHeight = 206;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            title,
            style: TextStyle(fontSize: titleSize, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(
                  width: 24,
                ),
                isLoading
                    ? const _SkeletonHorizontalBookList()
                    : _HorizontalBookListItems(
                        books: books,
                      ),
                const SizedBox(
                  width: 24,
                ),
              ],
            ))
      ],
    );
  }
}

class _HorizontalBookListItems extends StatelessWidget {
  const _HorizontalBookListItems({required this.books});

  final List<HorizontalBookListItemModel> books;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: books
            .asMap()
            .entries
            .map((bookEntry) => Row(children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(BookScreenController.routeName);
                    },
                    child: Container(
                      decoration: const BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(0, 5),
                            color: ColorPallete.homeScreenBookShadowColor)
                      ]),
                      width: HorizontalBookList.bookWidth,
                      height: HorizontalBookList.bookHeight,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          bookEntry.value.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  if (bookEntry.key != books.length - 1)
                    const SizedBox(
                      width: 24,
                      height: HorizontalBookList.bookHeight + 20,
                    )
                ]))
            .toList());
  }
}

class _SkeletonHorizontalBookList extends StatelessWidget {
  const _SkeletonHorizontalBookList();

  static const loadingCount = 3;

  @override
  Widget build(BuildContext context) {
    return Skeleton(
        child: Row(
      children: [
        ...List.generate(
          loadingCount,
          (index) => Row(
            children: [
              const SizedBox(
                width: HorizontalBookList.bookWidth,
                height: HorizontalBookList.bookHeight,
                child: ColoredBox(color: Colors.white),
              ),
              if (index != loadingCount - 1)
                const SizedBox(
                  width: 24,
                ),
            ],
          ),
        ),
      ],
    ));
  }
}
