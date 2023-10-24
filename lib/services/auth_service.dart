// ignore_for_file: avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<String?> register({
    required String email,
    required String password,
    required String name,
    required String surname,
    required String dateOfBirth,
  }) async {
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userReference = db.collection('users').doc(auth.currentUser!.uid);
      await userReference.set({
        'name': name,
        'surname': surname,
        'dateOfBirth': dateOfBirth,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message ?? 'An unknown error occurred.';
      }
    } catch (e) {
      return e.toString();
    }
    return 'Created a new account';
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      User? currentUser = FirebaseAuth.instance.currentUser;
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser!.uid)
          .get();
      //return userSnapshot.data();
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
