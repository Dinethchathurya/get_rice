import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class GetResult extends ChangeNotifier {
  final List<Map<String, dynamic>> userData = [];

  getResultFromFirebse() async {
    if (userData.length == 0) {
      var db = FirebaseFirestore.instance;
      var auth = FirebaseAuth.instance;
      final querySnapshot = await db
          .collection("result")
          .where(FieldPath.documentId,
              isGreaterThanOrEqualTo: auth.currentUser?.uid)
          .where(FieldPath.documentId,
              isLessThan: '${auth.currentUser?.uid}' + 'z')
          .get();

      querySnapshot.docs.forEach((doc) {
        userData.add(doc.data());
      });

      print(userData.length);
      print(userData);

      // Iterate through userData list
      for (var data in userData) {
        // Access each data item
        print("Date: ${data['date']}");
        print("Potassium: ${data['potassium']}");
        print("Nitrogen: ${data['nitrogen']}");
        print("pH: ${data['ph']}");
        print("Dates: ${data['dates']}");
        print("Phosphorus: ${data['phosphorus']}");
      }
      notifyListeners();
    }
  }

  appRefresh() {
    userData.clear();
    getResultFromFirebse();
  }
}
