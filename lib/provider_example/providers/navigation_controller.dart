import 'package:flutter/material.dart';
import 'package:practicee/main.dart';

class NavigationController extends ChangeNotifier {
  NavigationItem _navigationItem = NavigationItem.home;
  NavigationItem get navigationItem => _navigationItem;
  void changeNavigation(NavigationItem navigationItemm) {
    if (navigationItemm == _navigationItem) return;
    _navigationItem = navigationItemm;
    notifyListeners();
  }
}
