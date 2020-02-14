import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grades/addStudentPage.dart';
import 'student.dart';

class StudentListPage extends StatefulWidget {
 @override
 _StudentListPageState createState() {
   return _StudentListPageState();
 }
}

class _StudentListPageState extends State<StudentListPage> {
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text('Student List !!')),
     body: _buildBody(context),
     floatingActionButton: FloatingActionButton(
       onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => AddStudentPage()));
       },
       child: Icon(Icons.add),
     ),
   );
 }

 Widget _buildBody(BuildContext context) {
 return StreamBuilder<QuerySnapshot>(
   stream: Firestore.instance.collection('students').snapshots(),
   builder: (context, snapshot) {
     if (!snapshot.hasData) return LinearProgressIndicator();

     return _buildList(context, snapshot.data.documents);
   },
 );
}

 Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
   return ListView(
     padding: const EdgeInsets.only(top: 20.0),
     children: snapshot.map((data) => _buildListItem(context, data)).toList(),
   );
 }

 Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
   final student = Student(data);

   return Padding(
     key: ValueKey(student.matricule),
     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
     child: Container(
       decoration: BoxDecoration(
         border: Border.all(color: Colors.grey),
         borderRadius: BorderRadius.circular(5.0),
       ),
       child: ListTile(
         title: Text(student.name),
         trailing: Text(student.matricule),
         onTap: () => print(student),
       ),
     ),
   );
 }
}