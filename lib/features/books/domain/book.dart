class Book {
  final String id;
  final String title;
  final String author;
  final String imageUrl;
  final String publisher;
  final Duration duration;
  final String description;

  const Book(
      {required this.id,
      required this.title,
      required this.author,
      required this.imageUrl,
      required this.publisher,
      required this.duration,
      required this.description});
}
