import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Row(
        children: [
          /// SIDEBAR IZQUIERDA
          Container(
            width: 80,
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.black12)),
            ),
            child: Column(
              children: const [
                SizedBox(height: 30),

                Icon(Icons.camera_alt_outlined, size: 30),

                SizedBox(height: 40),

                Icon(Icons.home, size: 28),

                SizedBox(height: 30),

                Icon(Icons.search, size: 28),

                SizedBox(height: 30),

                Icon(Icons.play_circle_outline, size: 28),

                SizedBox(height: 30),

                Icon(Icons.favorite_border, size: 28),

                SizedBox(height: 30),

                Icon(Icons.add_box_outlined, size: 28),
              ],
            ),
          ),

          /// FEED CENTRAL
          Expanded(
            flex: 2,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              children: [
                /// STORIES
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Colors.purple, Colors.orange],
                                ),
                              ),

                              child: const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  "assets/images/collage2.jpg",
                                ),
                              ),
                            ),

                            const SizedBox(height: 5),

                            const Text("usuario"),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                /// POST
                Container(
                  width: 500,
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.black12)),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      /// CABECERA
                      const Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/collage2.jpg",
                            ),
                          ),

                          SizedBox(width: 10),

                          Text(
                            "psicologiaparanadie",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),

                          Spacer(),

                          Icon(Icons.more_horiz),
                        ],
                      ),

                      const SizedBox(height: 10),

                      /// IMAGEN
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/images/collage2.jpg"),
                      ),

                      const SizedBox(height: 10),

                      /// ICONOS
                      const Row(
                        children: [
                          Icon(Icons.favorite_border),

                          SizedBox(width: 15),

                          Icon(Icons.chat_bubble_outline),

                          SizedBox(width: 15),

                          Icon(Icons.send),

                          Spacer(),

                          Icon(Icons.bookmark_border),
                        ],
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "3182 Me gusta",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        "psicologiaparanadie Ando en modo extraterrestre...",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// PANEL DERECHO
          Container(
            width: 350,
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// PERFIL
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/collage2.jpg"),
                    ),

                    SizedBox(width: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "eysoyvale",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),

                        Text(
                          "Vale Rojas Durán",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),

                    Spacer(),

                    Text("Cambiar", style: TextStyle(color: Colors.blue)),
                  ],
                ),

                const SizedBox(height: 30),

                const Text(
                  "Sugerencias para ti",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                /// LISTA DE SUGERENCIAS
                const ListTile(
                  leading: CircleAvatar(),
                  title: Text("usuario1"),
                  subtitle: Text("Sugerencia para ti"),
                  trailing: Text(
                    "Seguir",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),

                const ListTile(
                  leading: CircleAvatar(),
                  title: Text("usuario2"),
                  subtitle: Text("Sugerencia para ti"),
                  trailing: Text(
                    "Seguir",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
