import 'package:flutter/material.dart';
import 'package:jail_fitness/res/colors.dart';

import 'home_page.dart';


class DailyRoutine extends StatefulWidget {
  const DailyRoutine({Key? key}) : super(key: key);

  @override
  State<DailyRoutine> createState() => _DailyRoutineState();
}

class _DailyRoutineState extends State<DailyRoutine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        children: [
          //back button and title
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
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
                    size: 20,
                  ),
                ),

                //title
                Text(
                  'Daily Activity',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //empty space
                SizedBox(width: 50),
              ],
            ),
          ),

          //empty space
          SizedBox(height: 20),

          //text
          Column(
            children: [
              Text(
                'Today',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'You have 2 hours left',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          //space between text and progress bar
          SizedBox(height: 20),
          //meal plan with meal icon
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //meal plan
                    Text(
                      'Meal Plan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      children: [
                        //#282D3B color round edge box
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xff282D3B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.fastfood,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Breakfast',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        //#282D3B color round edge box
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xff282D3B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.fastfood,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Lunch',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        //#282D3B color round edge box
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Color(0xff282D3B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.fastfood,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Dinner',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //progress bar

            ],
          ),



        ],
      ),
    );
  }
}
