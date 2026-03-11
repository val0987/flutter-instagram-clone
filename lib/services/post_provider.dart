import 'package:flutter/material.dart';
import '../models/post_model.dart';
import 'post_service.dart';

class PostProvider extends ChangeNotifier {
  final PostService _service = PostService();

  List<PostModel> _posts = [];
  bool _isLoading = false;
  String? _error;

  List<PostModel> get posts => _posts;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Cargar posts desde el servicio
  Future<void> loadPosts() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final fetchedPosts = await _service.fetchPosts();
      _posts = fetchedPosts;
    } catch (e) {
      _error = "Error al cargar posts";
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Like / Unlike
  void toggleLike(PostModel post) {
    post.isLiked = !post.isLiked;

    if (post.isLiked) {
      post.likeCount++;
    } else {
      post.likeCount--;
    }

    notifyListeners();
  }

  /// Crear nuevo post
  void addPost({
    required String username,
    required String caption,
    required String imageUrl,
    required String userImage,
  }) {
    final newPost = PostModel(
      username: username,
      caption: caption,
      imageUrl: imageUrl,
      userImage: userImage,
      likeCount: 0,
      comments: [],
    );

    _posts.insert(0, newPost);
    notifyListeners();
  }

  /// Eliminar post
  void removePost(PostModel post) {
    _posts.remove(post);
    notifyListeners();
  }

  /// Agregar comentario
  void addComment(PostModel post, String comment) {
    post.comments.add(comment);
    notifyListeners();
  }
}
