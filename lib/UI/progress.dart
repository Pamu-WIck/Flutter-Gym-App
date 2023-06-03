import 'package:flutter/material.dart';
import 'package:jail_fitness/UI/home_page.dart';
import 'package:jail_fitness/res/colors.dart';
import 'package:jail_fitness/util/chartUi.dart';
import 'package:jail_fitness/util/imgComp.dart';
import 'package:numberpicker/numberpicker.dart';

class progressUi extends StatefulWidget {
  const progressUi({Key? key}) : super(key: key);

  @override
  State<progressUi> createState() => _progressUiState();
}

class _progressUiState extends State<progressUi> {


  int _currentValue = 70;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //text title align to top
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //back button
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),

                      Text(
                        'Progress',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //empty icon
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),

                  //imgcompare() card
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: imgCompare(),
                  ),

                  SizedBox(height: 5),
                  Padding(
                    //padding only right and left
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Weight',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            //text field to get weught

                            Text(
                              '70 kg',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        //image icon with upload file open
                        Padding(
                          padding: const EdgeInsets.only( left: 100.0),
                          child: Container(

                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.image,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        //update weight button with #AE6FF2 and #795EF1 gradient
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
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
                            child: Center(
                              child: Text(
                                'Update',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                      child: Center(
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

                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(20),
                  //     child: progressChart(),
                  //   ),
                  // ),
                ],
              ),
            )));
  }
}

