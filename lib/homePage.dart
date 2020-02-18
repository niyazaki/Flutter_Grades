import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'studentListPage.dart';
import 'testListPage.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grades"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1,
            child: FlareActor(
              "assets/Student.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: 'loop',
            )
          )
          ,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentListPage()));
                },
                child: Text('Students'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TestListPage()));
                },
                child: Text('Tests'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
