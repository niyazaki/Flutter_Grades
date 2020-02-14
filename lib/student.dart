import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  final String matricule;
  final String firstname;
  final String lastname;

  Student(DocumentSnapshot snapshot)
    : matricule = snapshot.documentID,
      firstname = snapshot.data['firstname'],
      lastname = snapshot.data['lastname'];

  String get name => "$firstname $lastname";

  String toString() => "Student($matricule)<$name>";
}