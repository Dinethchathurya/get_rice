import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherCalculateScreen extends StatelessWidget {
  const WeatherCalculateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void getdata() async {
      String apiKey = '6f94d27289744596d64417bacd2fc36c';
      double lat = 6.839118;
      double lon = 80.021366;

      Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/forecast'
          '?lat=$lat&lon=$lon&appid=$apiKey');

      http.Response response = await http.get(url);
      var data = response.body;
      var decodedData = json.decode(data);
      var list = decodedData['list'];

      for (var entry in list) {
        var date = entry['dt_txt'];
        print('Date: $date');
      }
      // print(response.body);
    }

    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('calculate'),
          onPressed: () {
            getdata();
          },
        ),
      ),
    );
  }
}
