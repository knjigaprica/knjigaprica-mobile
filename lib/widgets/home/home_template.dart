import 'package:flutter/material.dart';

import '../../data/mocks.dart';
import '../../widgets/home/genres_list.dart';
import '../../widgets/home/book_list.dart';
import 'welcome_section.dart';

class HomeTemplate extends StatelessWidget {
  const HomeTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const WelcomeSection(),
          const SizedBox(
            height: 40,
          ),
          const BookList(title: 'Najnovije'),
          const SizedBox(
            height: 40,
          ),
          GenresList(
              title: 'Žanrovi',
              genres: DataMock.homeScreenGenres
                  .map((genre) =>
                      GenreListModel(name: genre.name, icon: genre.icon))
                  .toList()),
          const SizedBox(
            height: 1000,
          ),
        ],
      ),
    );
  }
}
