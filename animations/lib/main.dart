import 'package:animations/examples/example1.dart';
import 'package:animations/examples/example2/home.dart';
import 'package:animations/examples/example3.dart';
import 'package:animations/examples/example4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black38),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true
      ),
      home: const Example4()
    );
  }
}