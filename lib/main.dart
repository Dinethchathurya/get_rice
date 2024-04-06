import 'package:flutter/material.dart';
import 'homescreen.dart'; // Import the homescreen.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: HomePage(), // Use HomePage as the home screen
    );
  }
}
