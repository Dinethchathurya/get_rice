import 'package:flutter/cupertino.dart';

import 'ToRedySensorDataToAnalysis.dart';

class FertilizerCalculate extends ChangeNotifier {
  // I get lower boundary of levels for calculation. Because if current soil levels are lower
  // than lower boundary's level then only we need to feed Fertilizer.

  static const shouldPresentInSoilNitrogen = 50;
  static const shouldPresentInSoilPhosphorus = 20;
  static const shouldPresentInSoilPotassium = 100;
  static const shouldPresentInSoilPh = 5.5;

  // sensor readings,
  late int sensorNitrogen;
  late int sensorPhosphorus;
  late int sensorPotassium;
  late double sensorPh;

  //result strings
  late String isNeedToFeedNitrogen;
  late String isNeedToFeedPhosphorus;
  late String isNeedToFeedPotassium;
  late String isNeedToFeedPh;

  late int needToFeedUreaInKG;
  late int needToFeedTripleSuperPhosphateInKG;
  late int needToFeedPotassiumChlorideInKG;

  calculate() {
    SensorDataGetReady sensorDataGetReady = SensorDataGetReady();
    sensorDataGetReady.modifyDate();
    // get modified sensor data
    sensorNitrogen = sensorDataGetReady.averageNInt;
    sensorPhosphorus = sensorDataGetReady.averagePInt;
    sensorPotassium = sensorDataGetReady.averageKInt;
    sensorPh = sensorDataGetReady.averagePh;

    isNeedToFeedNitrogen = (sensorNitrogen < shouldPresentInSoilNitrogen)
        ? calculateNitrogen(sensorNitrogen, shouldPresentInSoilNitrogen)
        : 'Nitrogen level is ok ';
    isNeedToFeedPhosphorus = (sensorPhosphorus < shouldPresentInSoilPhosphorus)
        ? calculatePhosphorus(sensorPhosphorus, shouldPresentInSoilPhosphorus)
        : 'Phosphorus level is ok ';
    isNeedToFeedPotassium = (sensorPotassium < shouldPresentInSoilPotassium)
        ? calculatePotassium(sensorPotassium, shouldPresentInSoilPotassium)
        : 'Potassium level is ok';
    isNeedToFeedPh = (sensorPh < shouldPresentInSoilPh)
        ? calculatePh(sensorPh, shouldPresentInSoilPh)
        : 'Ph level is ok';

    print(
        '$isNeedToFeedNitrogen, $isNeedToFeedPhosphorus, $isNeedToFeedPotassium, $isNeedToFeedPh');
  }

  calculateNitrogen(sensorNitrogen, shouldPresentInSoilNitrogen) {
    late int differenceInNitrogen =
        shouldPresentInSoilNitrogen - sensorNitrogen;

    // To get Nitrogen(N) we use Urea as Fertilizer.
    // urea contains 46% nitrogen (N)
    //to get 1g of nitrogen (N) we need to get (100/46)g of Urea
    int needToFeedUreaInMG = (differenceInNitrogen * (100 / 46)).toInt();
    //needToFeedUreaInMG has mg/kg
    // to convert kg/ha call convertToHectare() method.
    needToFeedUreaInKG = convertToHectare(needToFeedUreaInMG);

    return 'Nitrogen(N) level is low $differenceInNitrogen to fix level you can use Urea $needToFeedUreaInMG mg/kg, $needToFeedUreaInKG kg/ha ';
  }

  calculatePhosphorus(sensorPhosphorus, shouldPresentInSoilPhosphorus) {
    late int distanceNitrogen =
        shouldPresentInSoilPhosphorus - sensorPhosphorus;

    // To get Phosphorus, we use Triple Super phosphate as Fertilizer.
    // urea contains 46% Triple Super phosphate
    //to get 1g of nitrogen (N) we need to get (100/46)g of Triple Super phosphate.

    int needToFeedTripleSuperPhosphateInMG =
        (distanceNitrogen * (100 / 46)).toInt();

    needToFeedTripleSuperPhosphateInKG =
        convertToHectare(needToFeedTripleSuperPhosphateInMG);
    return 'Phosphorus level is low to fix level you can use Triple Super phosphate $needToFeedTripleSuperPhosphateInKG kg/ha';
  }

  calculatePotassium(sensorPotassium, shouldPresentInSoilPotassium) {
    late int distanceNitrogen = shouldPresentInSoilPotassium - sensorPotassium;

    // To get Potassium, we use Potassium Chloride as Fertilizer.
    // urea contains 60% Potassium Chloride
    //to get 1g of nitrogen (N) we need to get (100/46)g of Potassium Chloride.

    int needToFeedPotassiumChlorideInMG =
        (distanceNitrogen * (100 / 60)).toInt();

    needToFeedPotassiumChlorideInKG =
        convertToHectare(needToFeedPotassiumChlorideInMG);
    return 'Potassium level is low to fix level you can use $needToFeedPotassiumChlorideInKG  kg/ha ';
  }

  calculatePh(double sensorPh, double shouldPresentInSoilPh) {
    late double distanceNitrogen = shouldPresentInSoilPh - sensorPh;
    return 'Ph level is low  $distanceNitrogen ';
  }

  int convertToHectare(int fertilizerInMG) {
    // these data currently un mg/kg, it need to convert kg/ha

    //kg/ha = ((mg/kg)*density*d)/10

    int fertilizerAmountInKg = ((fertilizerInMG) * 1410 * 0.1) ~/ 10;
    // Formula here
    return fertilizerAmountInKg;
  }
}
