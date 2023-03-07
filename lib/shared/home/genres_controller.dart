import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../features/books/data/genres_repository.dart';
import '../../features/books/presentation/home/home_horizontal_genres_list.dart';

class GenresController extends StatelessWidget {
  GenresController({super.key});

  final genresRepo = GetIt.I<GenresRepository>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: genresRepo.getGenres(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeHorizontalGenresList(
            title: 'Žanrovi',
            genres: snapshot.data!
                .map((genre) => HomeHorizontalGenresListItemModel(
                    name: genre.name, icon: genre.icon))
                .toList(),
          );
        } else {
          return const HomeHorizontalGenresList(
            title: 'Žanrovi',
            isLoading: true,
          );
        }
      },
    );
  }
}
