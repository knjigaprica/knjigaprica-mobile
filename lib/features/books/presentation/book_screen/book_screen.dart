import 'package:flutter/material.dart';

import '../../../../utils/constants/color_pallete.dart';
import 'book_description.dart';
import 'book_overview.dart';
import 'recommended_books_controller.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
          const SliverPersistentHeader(
            delegate: BookOverview(expandedHeight: 500),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: BookDescription(),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Divider(
                  height: 1,
                  indent: 24,
                  endIndent: 24,
                  thickness: 1,
                  color: ColorPallete.bookScreenBorderColor,
                ),
                const SizedBox(
                  height: 32,
                ),
                RecommendedBooksController(),
                const SizedBox(
                  height: 256,
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
