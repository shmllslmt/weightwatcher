import 'dart:math';
import 'package:flutter/material.dart';

class BMIBrain with ChangeNotifier {
  int _height = 250;
  int _weight = 50;
  double? _bmi;

  int get tinggi => _height;
  int get berat => _weight;

  void increaseHeight() {
    _height++;
    notifyListeners();
  }

  void decreaseHeight() {
    _height--;
    notifyListeners();
  }

  double calcBMI() {
    _bmi = _weight / pow((_height/100), 2);
    return _bmi!;
  }

  String displayBMI() {
    return calcBMI().toStringAsFixed(1);
  }

  String displayCategory() {
    double bmi = calcBMI();

    if(bmi >= 40)
      return "Obese";
    else if(bmi >= 25.0 && bmi < 40.0)
      return "Overweight";
    else if(bmi >= 18.5 && bmi < 25.0)
      return "Normal";
    else
      return "Underweight";
  }
}