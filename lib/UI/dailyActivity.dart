import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jail_fitness/res/colors.dart';
import 'package:jail_fitness/auth.dart';
import 'package:jail_fitness/util/MealService.dart'; // Import MealService
import 'home_page.dart';

class DailyRoutine extends StatefulWidget {
  const DailyRoutine({Key? key}) : super(key: key);

  @override
  State<DailyRoutine> createState() => _DailyRoutineState();
}

class _DailyRoutineState extends State<DailyRoutine> {
  final User? user = Auth().currentUser;
  final String userID = Auth().currentUser!.uid;
  final MealService mealService = MealService(); // Initialize MealService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: FutureBuilder<Map<String, dynamic>>(
        future: mealService.getMealForUser(userID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Show loading spinner while waiting for data
          } else if (snapshot.hasError) {
            return Text(
                'Error: ${snapshot.error}'); // Show error if there is any
          } else if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Meal Plan',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          buildMealRow(
                              'Breakfast', snapshot.data!['breakfast']),
                          SizedBox(height: 10),
                          buildMealRow('Lunch', snapshot.data!['lunch']),
                          SizedBox(height: 10),
                          buildMealRow('Dinner', snapshot.data!['dinner']),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            );
          } else {
            return Text(
                'No meal data found for the user'); // Show a message when no data is found
          }
        },
      ),
    );
  }

  Widget buildMealRow(String mealType, String mealDetail) {
    return Row(
      children: [
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mealType,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              mealDetail,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
