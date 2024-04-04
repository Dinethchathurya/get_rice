import 'package:flutter/material.dart';

import 'package:get_rice/Screens/Current.dart';

import 'package:get_rice/Screens/Past.dart';


import 'Screens/FertilizerCalculateScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/RegisterScreen.dart';
import 'Screens/WeatherCalculateScreen.dart';
import 'Screens/AnalysisResultScreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),

      initialRoute: '/result',

      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/FertilizerCalculateScreen': (context) => FertilizerCalculateScreen(),
        '/WeatherCalculateScreen': (context) => WeatherCalculateScreen(),

         '/result': (context) => resultScreen(),


        'CurrentPage': (context) => CurrentPage()

        '/past': (context) => Past(),

      },
    );
  }
}
