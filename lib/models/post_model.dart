class Post {
  final String username;
  final String userImage;
  final List<String> images;
  final String caption;
  bool isLiked;
  bool isSaved;

  Post({
    required this.username,
    required this.userImage,
    required this.images,
    required this.caption,
    this.isLiked = false,
    this.isSaved = false,
  });
}