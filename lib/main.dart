import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/post_provider.dart';
import 'screens/feed_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PostProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',

      /// PRIMERA PANTALLA
      home: const LoginScreen(),

      /// RUTAS (recomendado)
      routes: {'/feed': (context) => const FeedScreen()},
    );
  }
}
