class PostModel {
  String username;
  String userImage;
  String imageUrl;
  String caption;

  int likeCount;
  bool isLiked;

  List<String> comments;

  PostModel({
    required this.username,
    required this.userImage,
    required this.imageUrl,
    required this.caption,
    required this.likeCount,
    this.isLiked = false,
    List<String>? comments,
  }) : comments = comments ?? [];

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      username: map['username'] ?? '',
      userImage: map['userImage'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      caption: map['caption'] ?? '',
      likeCount: map['likes'] ?? 0,
      comments: [],
    );
  }
}