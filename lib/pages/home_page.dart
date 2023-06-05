import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jail_fitness/auth.dart';
import 'package:jail_fitness/UI/login.dart'; // import your LoginUI widget

class LogOut extends StatelessWidget {
  LogOut({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut(BuildContext context) async {
    await Auth().signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => loginUI())); // navigates to LoginUI
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _SignOutButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => signOut(context),
      child: const Text('Sign out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _title(),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _userUid(),
                _SignOutButton(context),
              ]
          ),
        )
    );
  }
}
