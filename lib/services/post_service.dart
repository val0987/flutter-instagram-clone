import 'dart:async';
import '../models/post_model.dart';

class PostService {
  Future<List<PostModel>> fetchPosts() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      PostModel(
        username: "valeria",
        caption: "Día increíble ✨",
        imageUrl: "https://picsum.photos/500/300?1",
        userImage: "https://i.pravatar.cc/150?img=5",
      ),

      PostModel(
        username: "alejo",
        caption: "Atardecer hermoso 🌅",
        imageUrl: "https://picsum.photos/500/300?2",
        userImage: "https://i.pravatar.cc/150?img=12",
      ),

      PostModel(
        username: "jose",
        caption: "Modo relax 🧘",
        imageUrl: "https://picsum.photos/500/300?3",
        userImage: "https://i.pravatar.cc/150?img=15",
      ),
    ];
  }
}
