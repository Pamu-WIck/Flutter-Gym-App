// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 183, 107, 214),
            Color.fromARGB(255, 106, 52, 232),
          ],
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //add column to the row
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Monthly Subscription
                // ignore: prefer_const_constructors
                Text(
                  'Monthly Subscription',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 10,
                    fontWeight: FontWeight.w100,
                  ),
                ),

                SizedBox(height: 5),

                //Paid Status
                Text(
                  'PAID',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                  ),
                ),

                SizedBox(height: 10),

                SizedBox(height: 15),

                //add text to the column Next training day
                Text(
                  'Next training day',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w100,
                  ),
                ),

                SizedBox(height: 5),

                //add text to the column
                Text(
                  '25 Jan, 2021',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            //add emoticon image to the row
            Image.asset(
              'assets/images/Figure.png',
              height: 200,
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}
