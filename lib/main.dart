import 'package:flutter/material.dart';
import 'test.dart';
//import 'abc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency App',
      theme: ThemeData.dark(),
      home: const Testabc(),
    );
  }
}
