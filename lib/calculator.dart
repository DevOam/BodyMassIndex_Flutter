import 'dart:math';

class Calculator {
  final int height;
  final int weight;
  double _bmi = 0;

  Calculator({
    required this.height,
    required this.weight,
  });

  String calculateBMI() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMIMessage() {
    if (_bmi > 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String idealWeight() {
    double minWeight = 18.5 * pow((height / 100), 2);
    double maxWeight = 25.0 * pow((height / 100), 2);
    return '${minWeight.toStringAsFixed(1)} Kg - ${maxWeight.toStringAsFixed(1)} Kg';
  }

  String getInterception() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You should not eat anything expect juck food';
    }
  }
}
