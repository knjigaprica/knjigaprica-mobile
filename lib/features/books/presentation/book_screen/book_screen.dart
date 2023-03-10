import 'package:flutter/material.dart';

import '../../../../utils/constants/color_pallete.dart';
import 'book_description.dart';
import 'book_overview.dart';

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
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: const [
                SizedBox(
                  height: 32,
                ),
                BookDescription(),
                SizedBox(
                  height: 32,
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: ColorPallete.bookScreenBorderColor,
                )
              ],
            ),
          )),
        ]),
      ),
    );
  }
}
