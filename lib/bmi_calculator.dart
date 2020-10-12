import 'dart:math';

class BMICalculator {
  BMICalculator._constructor();

  static final BMICalculator _instance = BMICalculator._constructor();
  double _height;
  double _weight;
  double _bmi;
  String _bodyType;
  String _description;

  factory BMICalculator() {
    return _instance;
  }

  BMICalculator setHeight(double height) {
    _height = height;
    return this;
  }

  BMICalculator setWeight(double weight) {
    _weight = weight;
    return this;
  }

  BMICalculator calculate() {
    return this._calculateBMI()._generateTextInfo();
  }

  BMICalculator _calculateBMI() {
    this._bmi = _weight / pow(_height / 100, 2);
    return this;
  }

  BMICalculator _generateTextInfo() {
    if (bmi >= 25) {
      _bodyType = "Overweight";
      _description =
          "You have a higher than normal body weight. Try to exercise more.";
    } else if (bmi > 18.5) {
      _bodyType = "Normal";
      _description = "You have a normal body weight. Good job!";
    } else {
      _bodyType = "Underweight";
      _description =
          "You have a lower than normal body weight. You can eat a bit more.";
    }

    return this;
  }

  String get bodyType => _bodyType;
  double get bmi => _bmi;
  String get description => _description;
}
