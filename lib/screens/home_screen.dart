import 'package:flutter/material.dart';
import 'feed_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: LayoutBuilder(
        builder: (context, constraints) {

          double width = constraints.maxWidth;

          /// 📱 MOBILE
          if (width < 700) {
            return const FeedScreen();
          }

          /// 📱 TABLET
          if (width < 1100) {
            return Row(
              children: [
                const Spacer(),

                Expanded(
                  flex: 3,
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 620),
                      child: const FeedScreen(),
                    ),
                  ),
                ),

                const Spacer(),
              ],
            );
          }

          /// 💻 WEB / DESKTOP
          return Row(
            children: [

              const Spacer(),

              Expanded(
                flex: 2,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 620),
                    child: const FeedScreen(),
                  ),
                ),
              ),

              const Spacer(),

            ],
          );
        },
      ),
    );
  }
}