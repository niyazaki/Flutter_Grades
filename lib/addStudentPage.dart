import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _formKey = GlobalKey<FormState>();
  final _matriculeController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();

  @override
  void dispose() {
    _matriculeController.dispose();
    _lastnameController.dispose();
    _firstnameController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Student"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _matriculeController,
                    decoration: const InputDecoration(
                      labelText: 'Matricule',
                      hintText: '123456',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a matricule';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _firstnameController,
                    decoration: const InputDecoration(
                      labelText: 'Firstname',
                      hintText: 'John',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a firstname';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _lastnameController,
                    decoration: const InputDecoration(
                      labelText: 'Lastname',
                      hintText: 'Connor',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter a lastname';
                      }
                      return null;
                    },
                  ),
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      var student = {
                        'firstname': _firstnameController.text,
                        'lastname': _lastnameController.text
                      };

                      var matricule = _matriculeController.text;

                      if (_formKey.currentState.validate()) {
                        Firestore.instance
                            .collection('students')
                            .document(matricule)
                            .setData(student);
                        Navigator.pop(context);
                      }
                    },
                    child: Text("Add"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
