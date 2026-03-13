import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post_model.dart';

class PostService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<PostModel>> fetchPosts() async {
    final snapshot = await _db.collection('posts').get();

    return snapshot.docs
        .map((doc) => PostModel.fromMap(doc.data()))
        .toList();
  }
}