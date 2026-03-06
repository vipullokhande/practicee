import 'package:flutter/material.dart';

class CounterProviderExample extends ChangeNotifier {
  String name = "Name";
  int age = 20;
  changeAge(int newAge) {
    if (age == newAge) return;
    if (age < 0) return;
    age = newAge;
    notifyListeners();
  }

  changeName(String newName) {
    if (newName.isEmpty) return;
    if (name == newName) return;
    name = newName;
    notifyListeners();
  }
}
