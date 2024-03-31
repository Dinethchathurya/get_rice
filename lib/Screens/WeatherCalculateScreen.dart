import 'package:flutter/material.dart';

import '../Services/WeatherCalculate.dart';

class WeatherCalculateScreen extends StatelessWidget {
  const WeatherCalculateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('calculate'),
          onPressed: () {
            Weather weather = Weather();
            weather.getdata();
          },
        ),
      ),
    );
  }
}
