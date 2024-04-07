import 'package:flutter/material.dart';
import 'package:get_rice/Services/StoreResults.dart';

class FertilizerCalculateScreen extends StatelessWidget {
  const FertilizerCalculateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('calculate'),
          onPressed: () async {
            StoreData storeData = StoreData();
            await storeData.store();
            Navigator.pop(context);
            Navigator.pushNamed(context, '/result');
          },
        ),
      ),
    );
  }
}
