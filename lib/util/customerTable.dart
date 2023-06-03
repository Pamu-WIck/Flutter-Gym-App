import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import '/data/customerTableData.dart'; // Import the table data file

class CustomerTable extends StatefulWidget {
  final List<Customer> customers;

  CustomerTable({required this.customers});

  @override
  _CustomerTableState createState() => _CustomerTableState();
}

class _CustomerTableState extends State<CustomerTable> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.customers.length,
      itemBuilder: (context, index) {
        final customer = widget.customers[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          child: ExpansionTileCard(
            colorCurve: Curves.easeIn,
            baseColor: Color(0xff282D3B),
            expandedColor: Colors.black,
            elevation: 2,
            title: Text(
              customer.name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              customer.paidStatus ? 'Paid' : 'Not Paid',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            children: [
              Divider(thickness: 1.0, height: 1.0, color: Colors.white),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Customer ID: ${customer.id}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Age: ${customer.age}',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
