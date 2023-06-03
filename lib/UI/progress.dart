import 'package:flutter/material.dart';
import 'package:jail_fitness/UI/home_page.dart';
import 'package:jail_fitness/res/colors.dart';
import 'package:jail_fitness/util/chartUi.dart';
import 'package:jail_fitness/util/imgComp.dart';

void main() {
  runApp(progress());
}

class progress extends StatelessWidget {
  const progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Introduction Screen Demo',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
      ),
      home: progressUi(),
    );
  }
}

class progressUi extends StatelessWidget {
  const progressUi({Key? key}) : super(key: key);

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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: progressChart(),
                ),
              ),
            ],
          ),
        )));
  }
}
