import 'package:flutter/material.dart';

class AgeProvider extends ChangeNotifier {
  double _age = 0; // Age starts at 0

  double get age => _age;

  void setAge(double newAge) {
    _age = newAge;
    notifyListeners();
  }
}
