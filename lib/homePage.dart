import 'package:flutter/material.dart';
import 'studentListPage.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grades"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentListPage())
            );
          },
          child: Text('Students'),
        )
      )
    );
  }
}