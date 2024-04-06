import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_rice/Screens/Current.dart';
import 'package:get_rice/Screens/Past.dart';
import 'package:provider/provider.dart';

import 'Screens/AnalysisResultScreen.dart';
import 'Screens/BottomSheet.dart';
import 'Screens/FertilizerCalculateScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/RegisterScreen.dart';
import 'Screens/WeatherCalculateScreen.dart';
import 'Screens/homescreen.dart';
import 'Services/FertilizerCalculate.dart';
import 'Services/GetLocation.dart';
import 'Services/GetResults.dart';
import 'Services/StoreResults.dart';
import 'Services/WeatherCalculate.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FertilizerCalculate>(
          create: (context) => FertilizerCalculate(),
        ),
        ChangeNotifierProvider<StoreData>(
          create: (context) => StoreData(),
        ),
        ChangeNotifierProvider<Weather>(
          create: (context) => Weather(),
        ),
        ChangeNotifierProvider<GetLocation>(
          create: (context) => GetLocation(),
        ),
      ],
      builder: (BuildContext context, Widget) {
        return MaterialApp(
          theme: ThemeData.light(),
          initialRoute: '/homePage',
          routes: {
            '/': (context) => LoginScreen(),
            '/register': (context) => RegisterScreen(),
            '/FertilizerCalculateScreen': (context) =>
                FertilizerCalculateScreen(),
            '/WeatherCalculateScreen': (context) => WeatherCalculateScreen(),
            '/testhome': (context) => TestHome(),
            '/bottomSheet': (context) => BottomSheetWidget(),
            '/result': (context) => resultScreen(),
            'CurrentPage': (context) => CurrentPage(),
            '/result': (context) => resultScreen(),
            'CurrentPage': (context) => CurrentPage(),
            '/past': (context) => Past(),
            '/homePage': (context) => BackgroundImageHomePage(),
          },
        );
      },
    );
  }
}

class TestHome extends StatelessWidget {
  const TestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            child: Text('click'),
            onPressed: () async {
              GetResult getResult = GetResult();
              getResult.getResultFromFirebse();
            }),
      ),
    );
  }
}
