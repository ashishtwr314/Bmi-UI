import "dart:math";

class CalculateBMI {
  CalculateBMI({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;

  String calculate() {
    _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return "OverWeight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "UnderWeight";
    }
  }

  String getInterpretration() {
    if (_bmi > 25) {
      return "Your BMI dosent look too good, Start a clean diet and exercise..";
    } else if (_bmi > 18.5) {
      return "Your BMI looks good..";
    } else {
      return "Your BMI, is too low, start eating more, you need to gain weight..";
    }
  }
}
