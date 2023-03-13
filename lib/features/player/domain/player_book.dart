import 'player_book_chapter.dart';

class PlayerBook {
  final String title;
  final String author;
  final List<PlayerBookChapter> chapters;

  const PlayerBook(
      {required this.title, required this.author, required this.chapters});
}
