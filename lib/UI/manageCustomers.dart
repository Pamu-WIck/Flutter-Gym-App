import 'package:flutter/material.dart';

import '../res/colors.dart';
import '/data/customerTableData.dart'; // Import the table data file
import '/util/customerTable.dart'; // Import the table UI file

void main() {
  runApp(ManageCustomer());
}

class ManageCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: CustomerTable(customers: customers),
      ),
    );
  }
}
