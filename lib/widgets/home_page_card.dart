import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../res/colors.dart';

class OverlappingImageCard extends StatelessWidget {
  final String userId;

  OverlappingImageCard({required this.userId});

  Future<DocumentSnapshot> getUserData() async {
    return await FirebaseFirestore.instance.collection('users').doc(userId).get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show loading indicator while waiting
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // Show error message if any error occurred
        } else {
          // Check if the user is paid
          bool isPaid = snapshot.data!['paidStatus'] ?? false;

          return Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Stack(
              alignment: Alignment.topRight,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 80),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: Card(
                        color: Colors.transparent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.gradientStartColor,
                                  AppColors.gradientEndColor,
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Monthly Subscription',
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    isPaid ? 'PAID' : 'NOT PAID', // Display if the user is paid or not
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  SizedBox(height: 15),
                                  Text(
                                    'Next training day',
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '25 Jan, 2021',
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -4,
                  right: -10,
                  child: Image.asset(
                    'assets/images/Figure.png',
                    width: 230,
                    height: 230,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
