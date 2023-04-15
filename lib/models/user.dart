import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  String surname;
  String dateOfBirth;

  User(this.name, this.surname, this.dateOfBirth);
}
