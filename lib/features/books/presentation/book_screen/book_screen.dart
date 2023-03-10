import 'package:flutter/material.dart';

import 'book_overview.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
          SliverPersistentHeader(
            delegate: BookOverview(expandedHeight: 500),
            pinned: true,
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: 2000,
          )),
        ]),
      ),
    );
  }
}
