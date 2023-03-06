import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../features/book/data/genres_repository.dart';
import '../../features/book/presentation/horizontal_genres_list.dart';

class GenresController extends StatelessWidget {
  GenresController({super.key});

  final genresRepo = GetIt.I<GenresRepository>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: genresRepo.getGenres(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HorizontalGenresList(
            title: 'Žanrovi',
            genres: snapshot.data!
                .map((genre) => HorizontalGenresListItemModel(
                    name: genre.name, icon: genre.icon))
                .toList(),
          );
        } else {
          return const HorizontalGenresList(
            title: 'Žanrovi',
            isLoading: true,
          );
        }
      },
    );
  }
}
