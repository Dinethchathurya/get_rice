import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetResult {
  getResultFromFirebse() async {
    var db = FirebaseFirestore.instance;
    var auth = FirebaseAuth.instance;
    final querySnapshot = await db
        .collection("result")
        .where(FieldPath.documentId,
            isGreaterThanOrEqualTo: auth.currentUser?.uid)
        .where(FieldPath.documentId, isLessThan: 'auth.currentUser?.uid' + 'z')
        .get();

    final List<Map<String, dynamic>> userData = [];

    querySnapshot.docs.forEach((doc) {
      userData.add(doc.data());
    });

    print(userData.length);
    print(userData);
  }
}
