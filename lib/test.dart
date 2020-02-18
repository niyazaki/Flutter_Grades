import 'package:cloud_firestore/cloud_firestore.dart';

class Test {
  final String id;
  final String name;
  final DateTime date;

  Test(DocumentSnapshot snapshot)
    : id = snapshot.documentID,
      name = snapshot.data['name'],
      date = snapshot.data['date'].toDate();

  String get formatedDate => "${date.day}/${date.month}/${date.year}";

  String toString() => "Test($id)<name: $name, date: $formatedDate>";
}