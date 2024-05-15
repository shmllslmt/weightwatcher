import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class BMIBrain with ChangeNotifier {
  int _height = 170;
  int _weight = 50;
  String _name = " ";
  double? _bmi;
  late var dietplan;

  int get tinggi => _height;
  int get berat => _weight;
  String get nama => _name;

  void increaseHeight() {
    _height++;
    notifyListeners();
  }

  void decreaseHeight() {
    _height--;
    notifyListeners();
  }

  void increaseWeight() {
    _weight++;
    notifyListeners();
  }

  void decreaseWeight() {
    _weight--;
    notifyListeners();
  }

  void updateName(String value) {
    _name = value;
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
  
  Future<void> promptDietPlan(ChatSession chat) async {
    try {
      final response = await chat.sendMessage(Content.text(
          "As an expert nutritionist, suggest dietary plan considering that my bmi is " +
              displayCategory() +
              ". Remove the necessary disclaimer. Ensure the suggestion is brief and concise."));
      dietplan = response.text;

      if (dietplan != null) {
        print(dietplan);
      } else {
        print("No response from Gemini");
      }
    } catch(e) {
      print(e.toString());
    } finally {

    }
  }
}