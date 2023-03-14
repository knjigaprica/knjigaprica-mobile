import 'player_book_chapter.dart';

class PlayerBook {
  final String title;
  final String author;
  final List<PlayerBookChapter> chapters;

  const PlayerBook(
      {required this.title, required this.author, required this.chapters});

  void selectChapter(String chapterId) {
    for (var chapter in chapters) {
      if (chapter.id == chapterId) {
        chapter.isSelected = true;
      } else {
        chapter.isSelected = false;
      }
    }
  }
}
