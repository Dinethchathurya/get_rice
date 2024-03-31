import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetPastData extends StatelessWidget {
  const GetPastData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            final db = FirebaseFirestore.instance;
            final city = <String, String>{
              "name": "Los Angeles",
              "state": "CA",
              "country": "USA"
            };

            db
                .collection("result")
                .doc("LA")
                .set(city)
                .onError((e, _) => print("Error writing document: $e"));

            //
            //
          },
          child: Text('kjbhksd'),
        ),
      ),
    );
  }
}
