import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    if (_captionController.text.isEmpty || _imageController.text.isEmpty) {
      return;
    }

    context.read<PostProvider>().addPost(
      username: "mi_usuario",
      caption: _captionController.text,
      imageUrl: _imageController.text,
      userImage: "https://i.pravatar.cc/150?img=20",
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _captionController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nueva publicación")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            /// CAPTION
            TextField(
              controller: _captionController,
              decoration: const InputDecoration(labelText: "Descripción"),
            ),

            const SizedBox(height: 16),

            /// IMAGE URL
            TextField(
              controller: _imageController,
              decoration: const InputDecoration(labelText: "URL de imagen"),
            ),

            const SizedBox(height: 24),

            /// PREVIEW DE IMAGEN
            if (_imageController.text.isNotEmpty)
              Image.network(_imageController.text, height: 200),

            const SizedBox(height: 24),

            /// BOTON PUBLICAR
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
