import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/FertilizerCalculateScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/RegisterScreen.dart';
import 'Screens/WeatherCalculateScreen.dart';
import 'Services/SavePastDataInFirestore.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/FertilizerCalculateScreen': (context) => FertilizerCalculateScreen(),
        '/WeatherCalculateScreen': (context) => WeatherCalculateScreen(),
        '/getpastdata': (context) => GetPastData(),
      },
    );
  }
}
<<<<<<< Updated upstream
=======

class GetPastData extends StatelessWidget {
  const GetPastData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            final db = FirebaseFirestore.instance;
            final city = <String, String>{
              "name": "Los Angeles",
              "state": "CA",
              "country": "USA"
            };

            db
                .collection("result")
                .doc("LA")
                .set(city)
                .onError((e, _) => print("Error writing document: $e"));

            //
          },
          child: Text('kjbhksd'),
        ),
      ),
    );
  }
}
>>>>>>> Stashed changes
