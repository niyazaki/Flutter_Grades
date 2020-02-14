import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'student.dart';

class AddStudentPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Student"),
      ),
      body: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Matricule',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a matricule';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Firstname',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a firstname';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Lastname',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a lastname';
                }
                return null;
              },
            ),
          ],
        )
      )
    );
  }
}