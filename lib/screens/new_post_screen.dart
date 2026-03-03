import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/post_model.dart';
import '../services/post_provider.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  void _publishPost() {
    if (_captionController.text.isEmpty ||
        _imageController.text.isEmpty) {
      return;
    }

    final newPost = PostModel(
      username: "mi_usuario",
      caption: _captionController.text,
      imageUrl: _imageController.text,
    );

    context.read<PostProvider>().addPost(newPost);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nueva publicación"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _captionController,
              decoration: const InputDecoration(
                labelText: "Descripción",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(
                labelText: "URL de imagen",
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _publishPost,
              child: const Text("Publicar"),
            ),
          ],
        ),
      ),
    );
  }
}