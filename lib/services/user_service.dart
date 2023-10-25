import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:helzy/models/user.dart';

class UserService {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final User? currentUser = FirebaseAuth.instance.currentUser;

  Future<MyUser?> loadUserData() async {
    final userSnapshot = await userCollection.doc(currentUser!.uid).get();
    final userData = userSnapshot.data();

    if (userData != null) {
      return MyUser.fromMap(userData as Map<String, dynamic>);
    } else {
      return null;
    }
  }

  Future<void> updateUserData({
    String? name,
    String? surname,
    String? dateOfBirth,
  }) async {
    final docReference = userCollection.doc(currentUser!.uid);
    final data = {
      if (name != null) 'name': name,
      if (surname != null) 'surname': surname,
      if (dateOfBirth != null) 'dateOfBirth': dateOfBirth,
    };

    try {
      await docReference.set(data, SetOptions(merge: true));
      log('Updated');
    } catch (e) {
      log('Failed to update: $e');
    }
  }
}
