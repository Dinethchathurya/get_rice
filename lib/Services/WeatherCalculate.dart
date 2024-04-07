import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'GetLocation.dart';

class Weather extends ChangeNotifier {
  late List<String> rainyDates = [];
  getData() async {
    String apiKey = '6f94d27289744596d64417bacd2fc36c';

    GetLocation getLocation = GetLocation();
    await getLocation.determinePosition();

    double lat = getLocation.latitude;
    double lon = getLocation.longitude;

    Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/forecast'
        '?lat=$lat&lon=$lon&appid=$apiKey');

    http.Response response = await http.get(url);
    var data = response.body;
    var decodedData = json.decode(data);
    var list = decodedData['list'];

    for (var entry in list) {
      var date = entry['dt_txt'];
      var id = entry['weather'][0]['id'];
      if (id >= 500 && id <= 504) {
        rainyDates.add(date);
      }
    }

    notifyListeners();

    // Check if rainyDates is not empty before accessing its first element
    if (rainyDates.isNotEmpty) {
      print(
          'We suggest you to put fertilizer before ${rainyDates.first}. Rainy date/dates : $rainyDates');
    } else {
      print('No rainy dates found.');
    }
  }
}
