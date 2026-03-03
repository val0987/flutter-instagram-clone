class PostModel {
  final String username;
  final String caption;
  final String imageUrl;

  bool isLiked;
  int likeCount;
  List<String> comments;

  PostModel({
    required this.username,
    required this.caption,
    required this.imageUrl,
    this.isLiked = false,
    this.likeCount = 120,
    List<String>? comments,
  }) : comments = comments ?? [];
}