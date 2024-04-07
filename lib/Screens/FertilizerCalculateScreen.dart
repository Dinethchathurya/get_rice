import 'package:flutter/material.dart';

class FertilizerCalculateScreen extends StatelessWidget {
  const FertilizerCalculateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text('calculate'),
          onPressed: () async {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/result');
          },
        ),
      ),
    );
  }
}
