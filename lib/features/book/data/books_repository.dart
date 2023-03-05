import '../domain/book.dart';

abstract class BooksRepository {
  Future<List<Book>> getPopularBooks();

  Future<List<Book>> getNewestBooks();
}
