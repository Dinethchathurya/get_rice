import 'package:flutter/cupertino.dart';

class SensorDataGetReady extends ChangeNotifier {
  List<String> N = [];
  List<String> P = [];
  List<String> K = [];
  List<String> Ph = [];

  List<int> Ns = [];
  List<int> Ps = [];
  List<int> Ks = [];
  List<int> Phs = [];

  late double averagePh;
  late int averageNInt;
  late int averagePInt;
  late int averageKInt;

  modifyDate() {
    // Convert elements in list N to integers
    Ns = N.map((string) => int.tryParse(string) ?? 0).toList();

    // Convert elements in list P to integers
    Ps = P.map((string) => int.tryParse(string) ?? 0).toList();

    // Convert elements in list K to integers
    Ks = K.map((string) => int.tryParse(string) ?? 0).toList();

    // Convert elements in list Ph to integers
    Phs = Ph.map((string) => int.tryParse(string) ?? 0).toList();

    double averageN = calculateAverage(Ns);
    double averageP = calculateAverage(Ps);
    double averageK = calculateAverage(Ks);
    averagePh = calculateAverage(Phs);

    averageNInt = averageN.toInt();
    averagePInt = averageP.toInt();
    averageKInt = averageK.toInt();
  }

  double calculateAverage(List<int> list) {
    if (list.isEmpty) return 0.0;

    int sum = list.reduce((value, element) => value + element);
    return sum / list.length;
  }
}
