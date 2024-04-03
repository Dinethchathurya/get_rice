import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'GetLocation.dart';

class Weather extends ChangeNotifier {
  late List<String> rainyDates = [];

  getData() async {
    String apiKey = '6f94d27289744596d64417bacd2fc36c';

    //call get location method before get location data
    //  await Provider.of<GetLocation>(context).determinePosition();

    GetLocation getLocation = GetLocation();
    await getLocation.determinePosition();

    //get location date form location class
    // double lat = Provider.of<GetLocation>(context, listen: false).latitude;
    // double lon = Provider.of<GetLocation>(context, listen: false).longitude;
    //

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
    print(
        'We suggest you to put fertilizer before ${rainyDates.first}. Rainy date/dates : $rainyDates');
  }
}
