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
        description: 'Description',
        duration: Duration(hours: 3, minutes: 32),
        publisher: 'Ukronija'),
    Book(
        id: '2',
        title: 'Kao leto',
        author: 'Vesna Dedić',
        imageUrl:
            'https://knjigaprica-prod.s3.eu-central-1.amazonaws.com/book_covers/kao_leto_vv.jpg',
        description: 'Description',
        duration: Duration(hours: 3, minutes: 2),
        publisher: 'IK Dedić'),
    Book(
        id: '3',
        title: 'Autobiografija',
        author: 'Branislav Nušić',
        imageUrl:
            'https://knjigaprica-prod.s3.eu-central-1.amazonaws.com/book_covers/AUTOBIOGRAFIJA.png',
        description: 'Description',
        duration: Duration(hours: 7, minutes: 56),
        publisher: 'Knjigaprica'),
    Book(
        id: '4',
        title: 'Sa pašnjaka do naučenjaka',
        author: 'Mihajlo I. Pupin',
        imageUrl:
            'https://knjigaprica-prod.s3.eu-central-1.amazonaws.com/book_covers/sa%20pasnjaka%20-%20cover.png',
        description: 'Description',
        duration: Duration(hours: 12, minutes: 2),
        publisher: 'Zavod za udžbenike'),
  ];

  @override
  Future<List<Book>> getNewestBooks() {
    return Future.delayed(
      const Duration(seconds: 5),
      () => _books,
    );
  }

  @override
  Future<List<Book>> getPopularBooks() {
    return Future.delayed(
      const Duration(seconds: 5),
      () => _books,
    );
  }

  @override
  Future<Book> getBook(String id) {
    return Future.delayed(
      const Duration(seconds: 5),
      () => _books.singleWhere((book) => book.id == id),
    );
  }
}
