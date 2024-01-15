import 'package:animations/examples/example8/home.dart';
import 'package:animations/examples/example1.dart';
import 'package:animations/examples/example2/home.dart';
import 'package:animations/examples/example3.dart';
import 'package:animations/examples/example4/home.dart';
import 'package:animations/examples/example5.dart';
import 'package:animations/examples/example6/example6.dart';
import 'package:animations/examples/example7/home.dart';
import 'package:animations/examples/example9/home.dart';
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
      home: const Example1()
    );
  }
}