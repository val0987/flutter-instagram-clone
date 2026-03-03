import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/post_provider.dart';
import '../widgets/post_widget.dart';
import 'new_post_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostProvider>().loadPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = context.watch<PostProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Instagram",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NewPostScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: _buildBody(postProvider),
    );
  }

  Widget _buildBody(PostProvider postProvider) {

    if (postProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (postProvider.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(postProvider.error!),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: postProvider.loadPosts,
              child: const Text("Reintentar"),
            ),
          ],
        ),
      );
    }

    if (postProvider.posts.isEmpty) {
      return const Center(
        child: Text("No hay publicaciones todavía"),
      );
    }

    return RefreshIndicator(
      onRefresh: postProvider.loadPosts,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: postProvider.posts.length,
        itemBuilder: (context, index) {
          return PostWidget(
            post: postProvider.posts[index],
          );
        },
      ),
    );
  }
}