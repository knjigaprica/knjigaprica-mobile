import 'package:flutter/material.dart';

import 'skeleton_book_screen.dart';

class BookScreenController extends StatelessWidget {
  const BookScreenController({super.key});

  static const routeName = '/book';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: SkeletonBookScreen());
  }
}
