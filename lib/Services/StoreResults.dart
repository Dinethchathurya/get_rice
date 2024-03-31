import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'FertilizerCalculate.dart';
import 'WeatherCalculate.dart';

class StoreResults extends ChangeNotifier {
  final cloud = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  store(context) async {
    //before access data i need to run these methods.
    await Provider.of<Weather>(context, listen: false).getData(context);
    await Provider.of<FertilizerCalculate>(context, listen: false).calculate();

    // results about Fertilizer.
    final nitrogen = Provider.of<FertilizerCalculate>(context, listen: false)
        .isNeedToFeedNitrogen;
    final phosphorus = Provider.of<FertilizerCalculate>(context, listen: false)
        .isNeedToFeedPhosphorus;
    final potassium = Provider.of<FertilizerCalculate>(context, listen: false)
        .isNeedToFeedPotassium;
    final ph =
        Provider.of<FertilizerCalculate>(context, listen: false).isNeedToFeedPh;

    late List<String> rainy =
        Provider.of<Weather>(context, listen: false).rainyDates;

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

    cloud
        .collection("result")
        .doc(userid)
        .collection(
            formattedDate) // Use the formatted date as the collection name
        .doc()
        .set(city)
        .catchError((error) => print("Error writing document: $error"));
  }
}
