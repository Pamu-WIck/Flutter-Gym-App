import 'package:flutter/material.dart';
import '../res/colors.dart';

class OverlappingImageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                              'PAID',
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
}
