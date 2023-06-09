import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/customerTable.dart';
import '../util/managePayment.dart';

class PaymentTable extends StatefulWidget {
  @override
  _PaymentTableState createState() => _PaymentTableState();
}

class _PaymentTableState extends State<PaymentTable> {
  late Future<List<Customer>> _customerListFuture;

  @override
  void initState() {
    super.initState();
    _customerListFuture = _getCustomers();
  }

  Future<List<Customer>> _getCustomers() async {
    QuerySnapshot customerSnapshot =
    await FirebaseFirestore.instance.collection('users').get();
    return customerSnapshot.docs
        .map((doc) => Customer.fromDocumentSnapshot(doc))
        .toList();
  }

  void _handlePaymentStatusUpdate(String uid, bool paidStatus) async {
    await ManagePayment.updatePaymentStatus(uid, !paidStatus);
    setState(() {
      _customerListFuture = _getCustomers();
    });
  }

  void _handleDeleteButton() async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Payments'),
          content: Text('Are you sure you want to delete all payments?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _resetPayments();
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _resetPayments() async {
    List<Customer> customers = await _customerListFuture;
    for (Customer customer in customers) {
      await ManagePayment.updatePaymentStatus(customer.uid, false);
    }
    setState(() {
      _customerListFuture = _getCustomers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Table'),
      ),
      body: FutureBuilder<List<Customer>>(
        future: _customerListFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            final customers = snapshot.data!;
            return Column(
              children: [
                ElevatedButton(
                  onPressed: _handleDeleteButton,
                  child: Text('Delete Payments'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: customers.length,
                    itemBuilder: (context, index) {
                      final customer = customers[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                        child: ExpansionTileCard(
                          colorCurve: Curves.easeIn,
                          baseColor: Color(0xff282D3B),
                          expandedColor: Colors.black,
                          elevation: 2,
                          title: Text(
                            customer.username,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: GestureDetector(
                            onTap: () => _handlePaymentStatusUpdate(
                                customer.uid, customer.paidStatus ?? false),
                            child: Icon(
                              customer.paidStatus == true
                                  ? FontAwesomeIcons.checkCircle
                                  : FontAwesomeIcons.circle,
                              color: customer.paidStatus == true
                                  ? Colors.green
                                  : Colors.grey,
                              size: 16,
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
                                    'Customer ID: ${customer.uid}',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Paid Status: ${customer.paidStatus ? 'Paid' : 'Not Paid'}',
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
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
