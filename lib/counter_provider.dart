import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _age = 0;

  int get age => _age;

  void setAge(int newAge) {
    _age = newAge;
    notifyListeners();
  }

  // Function to determine background color
  Color getBackgroundColor() {
    if (_age <= 33) {
      return Colors.green;
    } else if (_age <= 67) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}
