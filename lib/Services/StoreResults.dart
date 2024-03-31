import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StoreResults {
  final cloud = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  store() {
    final userid = auth.currentUser?.uid;
    final DateTime now = DateTime.now();
    final formattedDate =
        '${now.year}-${(now.month)}-${(now.day)}-${(now.hour)}-${(now.minute)}';
    final city = <String, String>{
      "name": "Los Angeles",
      "state": "CA",
      "country": "USA",
      "user": userid ?? '',
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
