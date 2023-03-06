import 'package:flutter/material.dart';

import 'genres_controller.dart';
import 'popular_books_controller.dart';
import 'welcome_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WelcomeSection(),
          const SizedBox(
            height: 40,
          ),
          PopularBooksController(),
          const SizedBox(
            height: 40,
          ),
          GenresController(),
        ],
      ),
    );
  }
}
