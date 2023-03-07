import '../domain/genre.dart';

abstract class GenresRepository {
  Future<List<Genre>> getGenres();
}
