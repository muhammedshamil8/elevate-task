class Post {
  final String location;
  final String type;
  final String description;
  final List<String> imageUrls;
  final String username;
  final String name;
  final String title;
  final String time;

  Post({
    this.location = '',
    this.name = '',
    this.title = '',
    this.description = '',
    this.time = '',
    required this.username,
    required this.type,
    required this.imageUrls,
  });
}
