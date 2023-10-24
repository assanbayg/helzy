import 'package:flutter/material.dart';

class HelzyStarsProvider with ChangeNotifier {
  int _waterCount = 15;
  int _sleepCount = 12;
  int _starsCount = 27;

  int get waterCount => _waterCount;
  int get sleepCount => _sleepCount;
  int get starsCount => _starsCount;
  set waterCount(int newCount) {
    _waterCount = newCount;
    notifyListeners();
  }

  set sleepCount(int newCount) {
    _sleepCount = newCount;
    notifyListeners();
  }

  set starsCount(int newCount) {
    _starsCount = newCount;
    notifyListeners();
  }
}

class Sleep with ChangeNotifier {
  List<double> sleepHours = [8, 4, 11, 5.6, 6.7, 8, 8];

  void addNew(val) {
    sleepHours.removeAt(0);
    sleepHours.add(val);
    notifyListeners();
  }
}
