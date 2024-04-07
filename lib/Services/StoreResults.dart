import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'FertilizerCalculate.dart';
import 'GetLocation.dart';
import 'WeatherCalculate.dart';

class StoreData extends ChangeNotifier {
  store() async {
    var db = FirebaseFirestore.instance;
    var auth = FirebaseAuth.instance;

    //before access data i need to run these methods.
    FertilizerCalculate fertilizerCalculate = FertilizerCalculate();
    await fertilizerCalculate.calculate();

    GetLocation getLocation = GetLocation();
    await getLocation.determinePosition();

    Weather weather = Weather();
    await weather.getData();

    // results about Fertilizer.
    final nitrogen = fertilizerCalculate.isNeedToFeedNitrogen;
    final phosphorus = fertilizerCalculate.isNeedToFeedPhosphorus;
    final potassium = fertilizerCalculate.isNeedToFeedPotassium;
    final ph = fertilizerCalculate.isNeedToFeedPh;

    late List<String> rainy = weather.rainyDates;

    // to store result
    final userid = auth.currentUser?.uid;
    final DateTime now = DateTime.now();
    final formattedDate =
        '${now.year}-${(now.month)}-${(now.day)}-${(now.hour)}-${(now.minute)}';

    final city = <String, dynamic>{
      "date": formattedDate,
      "nitrogen": nitrogen,
      "phosphorus": phosphorus,
      "potassium": potassium,
      "ph": ph,
      "dates": rainy,
    };

    await db
        .collection("result")
        .doc('$userid$formattedDate')
        .set(city)
        .catchError((error) => print("Error writing document: $error"));
  }
}
