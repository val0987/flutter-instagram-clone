import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      /// APPBAR INSTAGRAM
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(Icons.add_box_outlined),
          onPressed: () {},
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Instagram",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down)
          ],
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ],
      ),

      body: ListView(
        children: const [

          StoriesBar(),

          Divider(color: Colors.white12),

          PostCard(
            username: "valeria",
            image:
                "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee",
            caption: "Día increíble ✨",
          ),

          PostCard(
            username: "alejo",
            image:
                "https://images.unsplash.com/photo-1501785888041-af3ef285b470",
            caption: "Viaje increíble 🌎",
          ),
        ],
      ),

      /// NAVBAR
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/200",
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}

class StoriesBar extends StatelessWidget {
  const StoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),

            child: Column(
              children: [

                Container(
                  padding: const EdgeInsets.all(3),

                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFF58529),
                        Color(0xFFDD2A7B),
                        Color(0xFF8134AF),
                      ],
                    ),
                  ),

                  child: const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage("https://i.pravatar.cc/300"),
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "user$index",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final String username;
  final String image;
  final String caption;

  const PostCard({
    super.key,
    required this.username,
    required this.image,
    required this.caption,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;
  bool showHeart = false;

  void toggleLike() {
    setState(() {
      liked = !liked;
    });
  }

  void doubleTapLike() {
    setState(() {
      liked = true;
      showHeart = true;
    });

    Future.delayed(const Duration(milliseconds: 700), () {
      setState(() {
        showHeart = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// HEADER
        ListTile(
          leading: const CircleAvatar(
            backgroundImage:
                NetworkImage("https://i.pravatar.cc/200"),
          ),

          title: Text(
            widget.username,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

          subtitle: const Row(
            children: [
              Icon(Icons.music_note,
                  size: 14, color: Colors.white70),
              SizedBox(width: 4),
              Text(
                "Audio original",
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),

          trailing: const Icon(Icons.more_vert,
              color: Colors.white),
        ),

        /// IMAGE
        GestureDetector(
          onDoubleTap: doubleTapLike,
          child: Stack(
            alignment: Alignment.center,
            children: [

              Image.network(widget.image),

              if (showHeart)
                const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 100,
                )
            ],
          ),
        ),

        /// ACTIONS
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 8),

          child: Row(
            children: [

              GestureDetector(
                onTap: toggleLike,
                child: Icon(
                  liked
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color:
                      liked ? Colors.red : Colors.white,
                ),
              ),

              const SizedBox(width: 16),

              const Icon(Icons.chat_bubble_outline,
                  color: Colors.white),

              const SizedBox(width: 16),

              const Icon(Icons.send_outlined,
                  color: Colors.white),

              const Spacer(),

              const Icon(Icons.bookmark_border,
                  color: Colors.white),
            ],
          ),
        ),

        /// LIKES
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            liked
                ? "Liked by you and 120 others"
                : "Liked by valeria and 120 others",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        /// CAPTION
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 10),

          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${widget.username} ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextSpan(
                  text: widget.caption,
                  style:
                      const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}