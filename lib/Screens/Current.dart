import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class CurrentPage extends StatefulWidget {
  const CurrentPage({Key? key}) : super(key: key);

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  // Store the data that is retrieved from the sensors in a list.
  List<FertilizerData> _sensorData = [];

  @override
  void initState() {
    super.initState();
    // Start data retrieval process.
    _startDataRetrieval();
  }

  void _startDataRetrieval() {
    Random random = Random();
    Timer(Duration(seconds: random.nextInt(10)), _retrieveData);
  }

  // Retrieve data from the sensors
  void _retrieveData() {
    setState(() {
      _sensorData.add(
        FertilizerData(
          name: '',
          amount: 0,
          ph: 0,
          status: 'Recorded',
          nitrogen: 20,
          phosphorus: 30,
          potassium: 40,
        ),
      );
    });

    // Schedule next data retrieval.
    _startDataRetrieval();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 03, 169, 244),
        title: const Center(
          child: Text(
            "Current",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      // The data taken from the sensors is appended to the list as a card.
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: _sensorData.map((data) {
              return _buildFertilizerCard(data);
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 80.0),
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('Continue'),
          backgroundColor: Color.fromARGB(255, 03, 169, 244),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildFertilizerCard(FertilizerData data) {
    return SizedBox(
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
                "Nitrogen: ${data.nitrogen} mg/kg",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "Phosphorus: ${data.phosphorus} mg/kg",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "Potassium: ${data.potassium} mg/kg",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "pH: ${data.ph}",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Status:",
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 36.0,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(data.status),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text(
                      data.status,
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
    );
  }

  Color _getStatusColor(String status) {
    if (status == "Recorded") {
      return Color.fromARGB(255, 197, 202, 233);
    } else {
      return Colors.grey;
    }
  }
}

// Create 'FertilizerData' class.
class FertilizerData {
  final String name;
  final double amount;
  final double ph;
  final int nitrogen;
  final int phosphorus;
  final int potassium;
  final String status;

  FertilizerData({
    required this.name,
    required this.amount,
    required this.ph,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
    required this.status,
  });
}
