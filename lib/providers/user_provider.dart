import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:helzy/models/user.dart';
import 'package:helzy/services/user_service.dart';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();
  MyUser _user = MyUser(
    name: 'name',
    surname: 'surname',
    dateOfBirth: '',
  );

  MyUser get user => _user;

  set user(MyUser newUser) {
    _user = newUser;
    notifyListeners();
  }

  Future<void> loadUserData() async {
    try {
      final user = await _userService.loadUserData();
      // log('User data from Firestore: $user'); // Add this line to check the data.
      _user = user!;
      log('User data in UserProvider: $_user'); // Add this line to check the user object.
      notifyListeners();
    } catch (e) {
      log("Error loading user data: $e");
    }
  }
}
