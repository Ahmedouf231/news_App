import 'package:flutter/material.dart';
import 'package:news_project/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  
      home: Homescreen(),
    );
  }
}  
