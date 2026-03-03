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

  Future<void> loadPosts() async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      final fetchedPosts = await _service.fetchPosts();

      _posts = fetchedPosts;
    } catch (e) {
      _error = "Error al cargar posts";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleLike(PostModel post) {
    post.isLiked = !post.isLiked;
    post.likeCount += post.isLiked ? 1 : -1;
    notifyListeners();
  }

  void addPost(PostModel post) {
    _posts.insert(0, post);
    notifyListeners();
  }

  void removePost(PostModel post) {
    _posts.remove(post);
    notifyListeners();
  }

  void addComment(PostModel post, String comment) {
  post.comments.add(comment);
  notifyListeners();
  }
}