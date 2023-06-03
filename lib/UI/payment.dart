import 'package:flutter/material.dart';
import 'package:jail_fitness/UI/home_page.dart';
import 'package:font_awesome_flutter/src/icon_data.dart';
import '../res/colors.dart';

void main() {
  runApp(payment());
}

class payment extends StatelessWidget {
  const payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //hide debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: AppColors.primaryColor,
        body:
          Column(
            //title wih back button
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
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),

                    //title
                    Text(
                      'Payment',
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

              //payment method
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:


              //payment method
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CreditCardWidget(),
                ),
              ),

              ),

              Column(
                children: [
                  Text(
                    'Other Pyment Methods',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  height: 100, // Set your desired height
                  decoration: BoxDecoration(
                    color: const Color(0xFF282D3B),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.credit_card,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 20,),

                      Text(
                        'Credit Card',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // Your widget for the left side of the row
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // Your widget for the right side of the row
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  width: double.infinity,
                  height: 100, // Set your desired height
                  decoration: BoxDecoration(
                    color: const Color(0xFF282D3B),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.paypal,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 20,),

                      Text(
                        'Pay Pal',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // Your widget for the left side of the row
                        ),
                      ),
                      Expanded(
                        child: Container(
                          // Your widget for the right side of the row
                        ),
                      ),
                    ],
                  ),
                ),
              )



            ]),
      ),
    );
  }
}

class CreditCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF793EE4), Color(0xFFB76BD6)],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Commercial\nBank',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  '5134 **** **** 1234',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                //empty space
                SizedBox(width: 50),
                //icon
                Icon(
                  Icons.credit_card_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Sewmini Gamarachchi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '05/24',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


