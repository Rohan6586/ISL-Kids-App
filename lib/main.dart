import 'package:flutter/material.dart';
import 'category_buttons_screen.dart';
import 'video_screen.dart'; // This is used in routing

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISL Kids | My Contribution',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const CategoryButtonsScreen(),
    );
  }
}
