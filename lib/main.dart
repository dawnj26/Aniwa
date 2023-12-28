import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Aniwatch());
}

class Aniwatch extends StatelessWidget {
  const Aniwatch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AniWatch',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
