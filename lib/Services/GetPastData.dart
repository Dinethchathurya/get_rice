import 'package:cloud_firestore/cloud_firestore.dart';

class GetPastData {
  Future<void> fetchSubcollectionsInDocument() async {
    try {
      // Get a reference to the document
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection("your_collection_name")
          .doc("your_document_id")
          .get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Get the data from the document
        Map<String, dynamic>? data =
            documentSnapshot.data() as Map<String, dynamic>?;

        // Accessing subcollections by name
        List<String> subcollectionNames = [
          "subcollection1",
          "subcollection2"
        ]; // Add names of your subcollections here

        // Iterate through each subcollection
        for (String subcollectionName in subcollectionNames) {
          CollectionReference subCollectionRef = FirebaseFirestore.instance
              .collection("your_collection_name")
              .doc("your_document_id")
              .collection(subcollectionName);

          // Get documents within the subcollection
          QuerySnapshot querySnapshot = await subCollectionRef.get();

          // Process each document in the subcollection
          querySnapshot.docs.forEach((doc) {
            // Access document data
            print("Document ID: ${doc.id}");
            print("Data: ${doc.data()}");
          });
        }
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching subcollections in document: $e');
    }
  }

  getData() async {
    final db = FirebaseFirestore.instance;

    // var result = await db
    //     .collection("result")
    //     .doc("5ByY0vGCI2czTEN9aNa7sRdp1Gy2")
    //     .collection("2024-4-1-1-0")
    //     .doc("0oFbUYkp1ijK08dMJU9E")
    //     .get();

    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection("result")
        .doc("5ByY0vGCI2czTEN9aNa7sRdp1Gy2")
        .get();
    print(documentSnapshot.data());
  }
}
