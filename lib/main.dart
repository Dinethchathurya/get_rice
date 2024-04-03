import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/FertilizerCalculateScreen.dart';
import 'Screens/LoginScreen.dart';
import 'Screens/RegisterScreen.dart';
import 'Screens/WeatherCalculateScreen.dart';
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
          initialRoute: '/testhome',
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

              // StoreData storeData = StoreData();
              // storeData.store();
            }

            // FertilizerCalculate fertilizerCalculate = FertilizerCalculate();
            // await fertilizerCalculate.calculate(); // Call necessary method
            // await Provider.of<Weather>(context, listen: false).getData(context);
            // StoreResults storeResults = StoreResults();
            // storeResults.store(
            //   context,
            //   rainyDates:
            //       Provider.of<Weather>(context, listen: false).rainyDates,
            //   nitrogen: Provider.of<FertilizerCalculate>(context, listen: false)
            //       .isNeedToFeedNitrogen,
            //   phosphorus:
            //       Provider.of<FertilizerCalculate>(context, listen: false)
            //           .isNeedToFeedPhosphorus,
            //   potassium:
            //       Provider.of<FertilizerCalculate>(context, listen: false)
            //           .isNeedToFeedPotassium,
            //   ph: Provider.of<FertilizerCalculate>(context, listen: false)
            //       .isNeedToFeedPh,
            // );

            ),
      ),
    );
  }
}
