import 'package:flutter/material.dart';
import 'package:get_rice/Screens/FertilizerCalculateScreen.dart';

class resultScreen extends StatefulWidget {
  const resultScreen({Key? key}) : super(key: key);

  @override
  State<resultScreen> createState() => _resultScreenState();
}

class _resultScreenState extends State<resultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 03, 169, 244),
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
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 189, 189, 189),
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
                        Text(
                          'Weather Details',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rain (Now):"),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 197, 202, 233),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "2mm",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date:"),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 197, 202, 233),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "2024-03-30",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Time:"),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 36.0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 197, 202, 233),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "17:11",
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
              Center(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 189, 189, 189),
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
                        Text(
                          'Nitrogen',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recorded Amount (mg/kg):"),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 197, 202, 233),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "21",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("pH:"),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 36.0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 197, 202, 233),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "7.2",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Status:"),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 36.0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 197, 202, 233),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "OK",
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
                        Text(
                          'Phosphorus',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recorded Amount (mg/kg):"),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 197, 202, 233),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "41",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("pH:"),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 40.0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 197, 202, 233),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "6.0",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Status:"),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 36.0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 197, 202, 233),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "High",
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
                        Text(
                          'Potassium',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Recorded Amount (mg/kg):"),
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 197, 202, 233),
                              ),
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "18",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("pH:"),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 38.0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 197, 202, 233),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "5.9",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Status:"),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 36.0),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 197, 202, 233),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "Low",
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
                child: const Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FertilizerCalculateScreen()),
                  );
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 3, 169, 244))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
