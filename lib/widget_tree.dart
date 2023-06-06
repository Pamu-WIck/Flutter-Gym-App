import 'package:flutter/material.dart';
import 'package:jail_fitness/auth.dart';
import 'package:jail_fitness/UI/home_page.dart';
import 'package:jail_fitness/UI/login.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return loginUI();
          }
        });
  }
}
