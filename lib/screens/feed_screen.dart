import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/post_provider.dart';
import '../models/post_model.dart';
import '../widgets/stories_bar.dart';
import '../widgets/search_panel.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  bool _showSearch = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<PostProvider>().loadPosts());
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = context.watch<PostProvider>();

    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        children: [
          /// FEED NORMAL
          Row(
            children: [
              /// SIDEBAR
              Container(
                width: 240,
                padding: const EdgeInsets.symmetric(vertical: 25),

                decoration: const BoxDecoration(
                  border: Border(right: BorderSide(color: Color(0xff262626))),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Instagram",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    _sidebarItem(Icons.home_outlined),

                    _sidebarItem(
                      Icons.search,
                      onTap: () {
                        setState(() {
                          _showSearch = !_showSearch;
                        });
                      },
                    ),

                    _sidebarItem(Icons.explore_outlined),
                    _sidebarItem(Icons.video_library_outlined),
                    _sidebarItem(Icons.chat_bubble_outline),
                    _sidebarItem(Icons.favorite_border),
                    _sidebarItem(Icons.add_box_outlined),
                    _sidebarItem(Icons.person_outline),
                  ],
                ),
              ),

              /// FEED CENTRAL
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: 630,

                    child: Builder(
                      builder: (context) {
                        if (postProvider.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (postProvider.error != null) {
                          return Center(
                            child: Text(
                              postProvider.error!,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }

                        return ListView.builder(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemCount: postProvider.posts.length + 1,

                          itemBuilder: (context, index) {
                            /// STORIES
                            if (index == 0) {
                              return const Padding(
                                padding: EdgeInsets.only(bottom: 30),
                                child: StoriesBar(),
                              );
                            }

                            final PostModel post =
                                postProvider.posts[index - 1];

                            return Container(
                              margin: const EdgeInsets.only(bottom: 35),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  /// HEADER POST
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,

                                    leading: CircleAvatar(
                                      radius: 16,
                                      backgroundImage: NetworkImage(
                                        post.userImage,
                                      ),
                                    ),

                                    title: Text(
                                      post.username,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),

                                    trailing: const Icon(
                                      Icons.more_horiz,
                                      color: Colors.white,
                                    ),
                                  ),

                                  /// IMAGEN
                                  AspectRatio(
                                    aspectRatio: 1,
                                    child: Image.network(
                                      post.imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  /// BOTONES
                                  Row(
                                    children: [
                                      IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),

                                        icon: Icon(
                                          post.isLiked
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: post.isLiked
                                              ? Colors.red
                                              : Colors.white,
                                        ),

                                        onPressed: () {
                                          postProvider.toggleLike(post);
                                        },
                                      ),

                                      const SizedBox(width: 14),

                                      const Icon(
                                        Icons.chat_bubble_outline,
                                        color: Colors.white,
                                      ),

                                      const SizedBox(width: 14),

                                      const Icon(
                                        Icons.send,
                                        color: Colors.white,
                                      ),

                                      const Spacer(),

                                      const Icon(
                                        Icons.bookmark_border,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    "${post.likeCount} likes",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  const SizedBox(height: 4),

                                  Text(
                                    "${post.username} ${post.caption}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),

              /// PANEL DERECHO
              Container(
                width: 320,
                padding: const EdgeInsets.all(25),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),

                    const Text(
                      "Sugerencias para ti",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    _suggestion("usuario_1"),
                    const SizedBox(height: 14),
                    _suggestion("usuario_2"),
                    const SizedBox(height: 14),
                    _suggestion("usuario_3"),
                  ],
                ),
              ),
            ],
          ),

          /// PANEL BUSCAR (OVERLAY)
          if (_showSearch)
            const Positioned(
              left: 240,
              top: 0,
              bottom: 0,
              child: SearchPanel(),
            ),
        ],
      ),
    );
  }

  Widget _sidebarItem(IconData icon, {VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),

      child: GestureDetector(
        onTap: onTap,
        child: Icon(icon, color: Colors.white, size: 26),
      ),
    );
  }

  Widget _suggestion(String username) {
    return Row(
      children: [
        const CircleAvatar(radius: 16),

        const SizedBox(width: 10),

        Expanded(
          child: Text(username, style: const TextStyle(color: Colors.white)),
        ),

        const Text(
          "Seguir",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
