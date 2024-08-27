class StoryItem {
  final String imagePath;
  final String iconPath;
  final String title;
  final String description;
  final bool isWatched;

  StoryItem({
    required this.imagePath,
    required this.iconPath,
    required this.title,
    required this.description,
    this.isWatched = false,
  });
}
