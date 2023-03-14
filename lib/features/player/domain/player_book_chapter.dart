class PlayerBookChapter {
  final String id;
  final String name;
  final Duration duration;
  bool isSelected;

  PlayerBookChapter(
      {required this.id,
      required this.name,
      required this.duration,
      this.isSelected = false});
}
