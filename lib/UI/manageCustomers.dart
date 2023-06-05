import 'package:flutter/material.dart';
import '../util/customerTable.dart';

class ManageCustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Customers'),
      ),
      body: CustomerTable(),
    );
  }
}
