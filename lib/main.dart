import 'package:flutter/material.dart';
import 'package:get_rice/Screens/Current.dart';

import 'Screens/FertilizerCalculateScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/RegisterScreen.dart';
import 'Screens/WeatherCalculateScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: '/WeatherCalculateScreen',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/FertilizerCalculateScreen': (context) => FertilizerCalculateScreen(),
        '/WeatherCalculateScreen': (context) => WeatherCalculateScreen(),
        'CurrentPage': (context) => CurrentPage()
      },
    );
  }
}
