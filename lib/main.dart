import 'package:flutter/material.dart';
import 'package:paper_rock_scissors_game/screen/paper_rock_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaperRockScreen(),
    );
  }
}
