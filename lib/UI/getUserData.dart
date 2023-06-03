import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../UI//home_page.dart';

class UserForm extends StatefulWidget {
  @override
  UserFormState createState() => UserFormState();
}

class UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String _username = '';
  int _age = 0;
  double _weight = 0.0;

  Future<void> addUserToFirestore() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      await _firestore.collection('users').doc(currentUser.uid).set({
        'username': _username,
        'age': _age,
        'weight': _weight,
      });
      // Navigate to HomePage after successful addition
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Handle the case when there's no logged-in user
      print('No user is logged in');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Form'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Username'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username';
                }
                _username = value;
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                _age = int.tryParse(value) ?? 0;
                if (_age <= 0) {
                  return 'Please enter a valid age';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Weight'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your weight';
                }
                _weight = double.tryParse(value) ?? 0.0;
                if (_weight <= 0) {
                  return 'Please enter a valid weight';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  addUserToFirestore();
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
