import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../util/customerTable.dart';
import '../util/AdminUpgrade.dart';

class CustomerTable extends StatefulWidget {
  @override
  _CustomerTableState createState() => _CustomerTableState();
}

class _CustomerTableState extends State<CustomerTable> {
  late Future<List<Customer>> _customerListFuture;

  @override
  void initState() {
    super.initState();
    _customerListFuture = _getCustomers();
  }

  Future<List<Customer>> _getCustomers() async {
    QuerySnapshot customerSnapshot = await FirebaseFirestore.instance.collection('users').get();
    return customerSnapshot.docs.map((doc) => Customer.fromDocumentSnapshot(doc)).toList();
  }

  void _handleAdminUpgrade(String uid, bool isAdmin) async {
    if (isAdmin) {
      await AdminUpgrade.downgradeUserToNormal(uid);
    } else {
      await AdminUpgrade.upgradeUserToAdmin(uid);
    }

    setState(() {
      // Refresh the customer list after the upgrade/downgrade
      _customerListFuture = _getCustomers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Customer>>(
      future: _customerListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          final customers = snapshot.data!;
          return ListView.builder(
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
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        customer.paidStatus ? 'Paid' : 'Not Paid',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _handleAdminUpgrade(customer.uid, customer.isAdmin ?? false),
                        child: Icon(
                          customer.isAdmin == true ? FontAwesomeIcons.checkCircle : FontAwesomeIcons.circle,
                          color: customer.isAdmin == true ? Colors.green : Colors.grey,
                          size: 16,
                        ),
                      ),


                    ],
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
      },
    );
  }
}
