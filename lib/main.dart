import 'package:flutter/material.dart';
import 'package:task_todo/detail_screen.dart';
import 'package:task_todo/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Task Todo',
      theme: ThemeData(),
      home: const MainScreen(),
    );
  }
}
