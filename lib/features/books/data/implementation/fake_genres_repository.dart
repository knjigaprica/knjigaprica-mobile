import 'package:flutter/material.dart';

import '../../domain/genre.dart';
import '../genres_repository.dart';

class FakeGenresRepository extends GenresRepository {
  static const List<Genre> _genres = [
    Genre(name: 'Lektire', icon: Icons.menu_book_sharp),
    Genre(name: 'Drama', icon: Icons.theater_comedy),
    Genre(name: 'Komedija', icon: Icons.tag_faces_sharp),
    Genre(name: 'Klasici', icon: Icons.business_outlined),
    Genre(name: 'Biznis', icon: Icons.business_center_outlined),
    Genre(name: 'Triler', icon: Icons.attractions),
  ];

  @override
  Future<List<Genre>> getGenres() {
    return Future.delayed(
      const Duration(seconds: 5),
      () => _genres,
    );
  }
}
