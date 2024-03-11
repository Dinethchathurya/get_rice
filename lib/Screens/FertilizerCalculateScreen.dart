import 'package:flutter/material.dart';

import '../Services/FertilizerCalculate.dart';

class FertilizerCalculateScreen extends StatelessWidget {
  const FertilizerCalculateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('calculate'),
          onPressed: () {
            FertilizerCalculate fertilizerCalculate = FertilizerCalculate();
            fertilizerCalculate.calculate();
          },
        ),
      ),
    );
  }
}
