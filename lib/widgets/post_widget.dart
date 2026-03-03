import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/post_model.dart';
import '../services/post_provider.dart';

class PostWidget extends StatefulWidget {
  final PostModel post;

  const PostWidget({super.key, required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool showHeart = false;

  void _toggleLike() {
    Provider.of<PostProvider>(context, listen: false)
        .toggleLike(widget.post);
  }

  void _handleDoubleTap() {
    if (!widget.post.isLiked) {
      _toggleLike();
    }

    setState(() {
      showHeart = true;
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      if (mounted) {
        setState(() {
          showHeart = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final username = widget.post.username;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey.shade300,
            child: Text(
              username[0].toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          title: Text(
            username,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.more_vert),
        ),

        Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onDoubleTap: _handleDoubleTap,
              child: Image.network(
                widget.post.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            AnimatedOpacity(
              opacity: showHeart ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 100,
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              GestureDetector(
                onTap: _toggleLike,
                child: AnimatedScale(
                  scale: widget.post.isLiked ? 1.2 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    widget.post.isLiked
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.post.isLiked
                        ? Colors.red
                        : Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline),
              const SizedBox(width: 16),
              const Icon(Icons.send),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "${widget.post.likeCount} likes",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 4),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "$username ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: widget.post.caption),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),
        const Divider(height: 1),
      ],
    );
  }
}