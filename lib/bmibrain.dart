import 'dart:math';

class BMIBrain {
  final int height;
  final int weight;
  double? bmi;

  BMIBrain({required this.height, required this.weight});

  double calcBMI() {
    bmi = weight / pow((height/100), 2);
    return bmi!;
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