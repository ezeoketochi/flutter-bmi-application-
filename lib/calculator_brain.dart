import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.heightC, required this.weightC});
  final int heightC;
  final int weightC;

  late int _bmi;

  String calculateBMI() {
    var heightsquare = pow(heightC / 100, 2);

    _bmi = (weightC / heightsquare).round();

    return _bmi.toString();
  }

  String getResult() {
    if (_bmi >= 25) {
      return "OverWeight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretations() {
    if (_bmi >= 25) {
      return "Go and exercise osiso";
    } else if (_bmi >= 18.5) {
      return "You have a normal body weight.";
    } else {
      return "You have a lower than normal body weight";
    }
  }
}
