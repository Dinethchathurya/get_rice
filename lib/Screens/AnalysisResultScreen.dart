import 'package:flutter/material.dart';
import 'package:get_rice/Screens/FertilizerCalculateScreen.dart';
import 'package:provider/provider.dart';

import '../Services/FertilizerCalculate.dart';
import '../Services/WeatherCalculate.dart';

class resultScreen extends StatelessWidget {
  const resultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 03, 169, 244),
        title: const Center(
          child: Text(
            "Results",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 189, 189, 189),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Text(
                    "Weather",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Weather Details',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("First Rainy date-time:"),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 197, 202, 233),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  Provider.of<Weather>(context)
                                      .rainyDates
                                      .first,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 189, 189, 189),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: const Text(
                    "Fertilizer",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Urea',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Need Amount (kg/ha):"),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 197, 202, 233),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "${Provider.of<FertilizerCalculate>(context).needToFeedUreaInKG}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("pH:"),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 36.0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 197, 202, 233),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: const Text(
                                "7.2",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Triple Super phosphate',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Recorded Amount (mg/kg):"),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 197, 202, 233),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "${Provider.of<FertilizerCalculate>(context).needToFeedTripleSuperPhosphateInKG}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("pH:"),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 40.0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 197, 202, 233),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: const Text(
                                "6.0",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Card(
                  elevation: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Potassium Chloride',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Recorded Amount (mg/kg):"),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 197, 202, 233),
                              ),
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "${Provider.of<FertilizerCalculate>(context).needToFeedPotassiumChlorideInKG}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("pH:"),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 38.0),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 197, 202, 233),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: const Text(
                                "5.9",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const FertilizerCalculateScreen()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 3, 169, 244),
                  ),
                ),
                child: const Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
