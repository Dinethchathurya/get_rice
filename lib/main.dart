import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/FertilizerCalculateScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/RegisterScreen.dart';
import 'Screens/WeatherCalculateScreen.dart';
import 'Services/FertilizerCalculate.dart';
import 'Services/StoreResults.dart';
import 'Services/WeatherCalculate.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FertilizerCalculate>(
          create: (context) => FertilizerCalculate(),
        ),
        ChangeNotifierProvider<StoreResults>(
          create: (context) => StoreResults(),
        ),
        ChangeNotifierProvider<Weather>(
          create: (context) => Weather(),
        ),
      ],
      builder: (BuildContext context, Widget) {
        return MaterialApp(
          theme: ThemeData.light(),
          initialRoute: '/',
          routes: {
            '/': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/FertilizerCalculateScreen': (context) =>
                FertilizerCalculateScreen(),
            '/WeatherCalculateScreen': (context) => WeatherCalculateScreen(),
            '/testhome': (context) => TestHome(),
          },
        );
      },
    );
  }
}
