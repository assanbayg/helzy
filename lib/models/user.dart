import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserClass {
  final String uid;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final User? currentUser = FirebaseAuth.instance.currentUser;

  UserClass({required this.uid});

  Future<DocumentSnapshot> loadUserData() async {
    final userSnapshot =
        await db.collection('users').doc(currentUser!.uid).get();
    return userSnapshot;
  }

  Future<void> updateUserData({
    String? name,
    String? surname,
    String? dateOfBirth,
  }) async {
    final docReference = db.collection('users').doc(currentUser!.uid);
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
