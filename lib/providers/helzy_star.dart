import 'package:flutter/material.dart';

class HelzyStars with ChangeNotifier {
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
