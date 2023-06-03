import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jail_fitness/UI/manageCustomers.dart';
import 'package:jail_fitness/UI/payment.dart';
import 'package:jail_fitness/UI/progress.dart';
import 'package:jail_fitness/res/colors.dart';
import 'package:jail_fitness/util/home_page_card.dart';
import 'package:jail_fitness/util/home_tile.dart';

import 'dailyActivity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottom navigation bar with Home, Profile, Chat, settings without wite bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),

      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //back button
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),

                //home title name 'Home'
                Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                //profile icon image
                CircleAvatar(
                  //backgroundImage: AssetImage('assets/images/profile.jpeg'),

                  radius: 18,
                  //backgroundImage: AssetImage('assets/images/profile.jpeg'),

                  child: Icon(
                    FontAwesomeIcons.userDoctor,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),

            //add space between the row and the column
            SizedBox(height: 20),

            Column(
              //align text to left
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //greeting text
                Text('Hello',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )),

                //date text
                Text(
                  '23 Jan, 2021',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            //add space between the column and the column
            SizedBox(height: 20),

            //add ui card
            HomeCard(),

            //add space between the column and the column
            SizedBox(height: 20),

            //round squre box empty
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Working Progress
                      HomeTile(
                        title: 'Working Progress',
                        subtitle: 'Your Daily Progress of Workout',
                        icon: FontAwesomeIcons.chartGantt,
                        color: Colors.purple,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => progress()),
                          );
                        },
                      ),

                      //Daily Routine
                      HomeTile(
                        title: 'Daily Routine',
                        subtitle: 'Your Daily Routine of Workout',
                        icon: Icons.access_time,
                        color: Colors.blue,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DailyRoutine()),
                          );
                        },
                      ),
                    ],
                  ),

                  //add space between the row and the column
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //payment details
                      HomeTile(
                        title: 'Payment Details',
                        subtitle: 'Your Daily Progress of Workout',
                        icon: Icons.payment,
                        color: Colors.orange,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => payment()),
                          );
                        },
                      ),
                      //manage customers
                      HomeTile(
                        title: 'Manage Customers',
                        subtitle: 'Your Daily Progress of Workout',
                        icon: Icons.people,
                        color: Colors.green,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ManageCustomer()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
