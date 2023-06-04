import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jail_fitness/UI/home_page.dart';
import 'package:jail_fitness/res/colors.dart';
import 'package:jail_fitness/util/chartUi.dart';
import 'package:jail_fitness/util/imgComp.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:intl/intl.dart';
import '../auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class progressUi extends StatefulWidget {
  const progressUi({Key? key}) : super(key: key);

  @override
  State<progressUi> createState() => _progressUiState();
}

class _progressUiState extends State<progressUi> {
  final User? user = Auth().currentUser;
  final _firestore = FirebaseFirestore.instance;
  int _currentValue = 70;

  String imageOne = 'assets/images/1.jpg';
  String imageTwo = 'assets/images/2.jpg';

  String getCurrentDate() {
    var now = DateTime.now();
    var formatter = DateFormat('dd/MM/yyyy'); // Format as "Month day"
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [


              // imgcompare() card
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20),
                child: imgCompare(
                    itemTwoImagePath: imageTwo,
                    userId: user!.uid
                ),
              ),

              SizedBox(height: 10),

              NumberPicker(
                value: _currentValue,
                minValue: 0,
                maxValue: 150,
                step: 1,
                onChanged: (value) => setState(() => _currentValue = value),
              ),

              //number picker submit button
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffAE6FF2),
                        Color(0xff795EF1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Save the selected weight and current date to Firestore
                      _firestore.collection('weights').add({
                        'userID': user!.uid,
                        'weight': _currentValue,
                        'date': getCurrentDate(),
                      });
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              //chart card
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ProgressChart(
                    userId: user!.uid,
                  ),
                ),

              )
            ],
          ),
        )));
  }
}
