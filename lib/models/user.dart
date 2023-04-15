// ignore_for_file: avoid_init_to_null

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserClass {
  final String uid;

  UserClass({required this.uid});

  final db = FirebaseFirestore.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot> loadUserData() async {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get();

    return userSnapshot;
  }

  Future<void> updateUserData({
    name = null,
    surname = null,
    dateOfBirth = null,
  }) async {
    final docReference = db.collection('users').doc(currentUser!.uid);
    docReference.set({
      'name': name!,
      'surname': surname!,
      'dateOfBirth': dateOfBirth!,
    }, SetOptions(merge: true)).then((_) {
      print('Updated');
    }).catchError((e) {
      print('Failed to update');
    });
  }
}
