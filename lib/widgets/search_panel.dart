import 'package:flutter/material.dart';

class SearchPanel extends StatelessWidget {
  const SearchPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: double.infinity,
      color: const Color(0xff000000),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const SizedBox(height: 40),

          /// HEADER
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: const [
                Text(
                  "Buscar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.close, color: Colors.white),
              ],
            ),
          ),

          const SizedBox(height: 20),

          /// SEARCH FIELD
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              style: const TextStyle(color: Colors.white),

              decoration: InputDecoration(
                hintText: "Buscar",
                hintStyle: const TextStyle(color: Colors.grey),

                filled: true,
                fillColor: const Color(0xff262626),

                prefixIcon: const Icon(Icons.search, color: Colors.grey),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// RECENTS HEADER
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Recientes",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10),

          /// LISTA DE BUSQUEDAS
          Expanded(
            child: ListView(
              children: const [
                _RecentItem(
                  username: "oscar.h.villalobos",
                  subtitle: "Oscar Hernan Villalobos",
                ),

                _RecentItem(
                  username: "dpielcueros.co",
                  subtitle: "D'PIEL BOLSOS",
                ),

                _RecentItem(
                  username: "bolsosycalzadohayo",
                  subtitle: "Bolsos & Calzado Hayo",
                ),

                _RecentItem(
                  username: "acuarellaaccesorios",
                  subtitle: "ACUARELLA ACCESORIOS",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentItem extends StatelessWidget {
  final String username;
  final String subtitle;

  const _RecentItem({required this.username, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(radius: 18, backgroundColor: Colors.grey),

      title: Text(username, style: const TextStyle(color: Colors.white)),

      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),

      trailing: const Icon(Icons.close, color: Colors.grey),
    );
  }
}
