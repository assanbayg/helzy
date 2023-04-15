import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  final db = FirebaseFirestore.instance;

  Future<void> addUser(String name, String surname, String dateOfBirth) async {
    try {
      await db.collection('users').add({
        'name': name,
        'surname': surname,
        'dateOfBirth': dateOfBirth,
      }).then((DocumentReference doc) {
        print('DocumentSnapshot added with ID: ${doc.id}');
      });
    } catch (e) {
      print('Error adding user');
    }
  }

  Future<void> readUser(String name) async {
    try {
      await db.collection("users").get().then((event) {
        for (var doc in event.docs) {
          print("${doc.id} => ${doc.data()}");
        }
      });
    } catch (e) {
      print('No such user!');
    }
  }

  Future<void> updateUserName(String name, String newName) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(name).update({
        'name': newName,
      });
    } catch (e) {
      print(e);
    }
  }
}
