import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'FertilizerCalculate.dart';
import 'GetLocation.dart';
import 'WeatherCalculate.dart';
//
// class StoreResults extends ChangeNotifier {
//   final cloud = FirebaseFirestore.instance;
//   final auth = FirebaseAuth.instance;
//
//   store(
//     BuildContext context, {
//     required List<String> rainyDates,
//     required nitrogen,
//     required phosphorus,
//     required potassium,
//     required ph,
//   }) async {
//     // results about Fertilizer.
//
//     Weather weather = Weather();
//     // await weather.getData(context);
//
//     final userid = auth.currentUser?.uid;
//     final DateTime now = DateTime.now();
//     final formattedDate =
//         '${now.year}-${(now.month)}-${(now.day)}-${(now.hour)}-${(now.minute)}';
//
//     final city = <String, dynamic>{
//       "nitrogen": nitrogen,
//       "phosphorus": phosphorus,
//       "potassium": potassium,
//       "ph": ph,
//       "dates": rainyDates,
//     };
//
//     cloud
//         .collection("result")
//         .doc(userid)
//         .collection(
//             formattedDate) // Use the formatted date as the collection name
//         .doc()
//         .set(city)
//         .catchError((error) => print("Error writing document: $error"));
//   }
//

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
      "nitrogen": nitrogen,
      "phosphorus": phosphorus,
      "potassium": potassium,
      "ph": ph,
      "dates": rainy,
    };

    db
        .collection("result")
        .doc(userid)
        .collection(
            formattedDate) // Use the formatted date as the collection name
        .doc()
        .set(city)
        .catchError((error) => print("Error writing document: $error"));
  }
}
