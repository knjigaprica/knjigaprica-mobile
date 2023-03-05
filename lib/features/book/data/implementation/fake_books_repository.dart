import '../../domain/book.dart';
import '../books_repository.dart';

class FakeBooksRepository extends BooksRepository {
  static const List<Book> _books = [
    Book(
      id: '1',
      title: 'Ecce homo',
      author: 'Fridrih Niče',
      imageUrl:
          'https://knjigaprica-prod.s3.eu-central-1.amazonaws.com/book_covers/Ecce%20homo.png',
    ),
    Book(
      id: '2',
      title: 'Kao leto',
      author: 'Vesna Dedić',
      imageUrl:
          'https://knjigaprica-prod.s3.eu-central-1.amazonaws.com/book_covers/kao_leto_vv.jpg',
    ),
    Book(
      id: '3',
      title: 'Autobiografija',
      author: 'Branislav Nušić',
      imageUrl:
          'https://knjigaprica-prod.s3.eu-central-1.amazonaws.com/book_covers/AUTOBIOGRAFIJA.png',
    ),
    Book(
      id: '4',
      title: 'Sa pašnjaka do naučenjaka',
      author: 'Mihajlo I. Pupin',
      imageUrl:
          'https://knjigaprica-prod.s3.eu-central-1.amazonaws.com/book_covers/sa%20pasnjaka%20-%20cover.png',
    ),
  ];

  @override
  Future<List<Book>> getNewestBooks() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => _books,
    );
  }

  @override
  Future<List<Book>> getPopularBooks() {
    return Future.delayed(
      const Duration(seconds: 1),
      () => _books,
    );
  }
}
