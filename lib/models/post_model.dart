class PostModel {
  final String username;
  final String caption;
  final String imageUrl;
  final String userImage;

  bool isLiked;
  int likeCount;
  List<String> comments;

  PostModel({
    required this.username,
    required this.caption,
    required this.imageUrl,
    required this.userImage,
    this.isLiked = false,
    this.likeCount = 120,
    List<String>? comments,
  }) : comments = comments ?? [];
}
