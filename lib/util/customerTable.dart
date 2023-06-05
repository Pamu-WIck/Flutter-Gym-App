import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  final String uid;
  final String username;
  final int age;
  final double weight;
  final bool paidStatus;

  Customer({
    required this.uid,
    required this.username,
    required this.age,
    required this.weight,
    required this.paidStatus,
  });

  factory Customer.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    return Customer(
      uid: documentSnapshot.id,
      username: data['username'],
      age: data['age'],
      weight: data['weight'],
      // If 'paidStatus' doesn't exist in the document, interpret that as the user not having paid
      paidStatus: data.containsKey('paidStatus') ? data['paidStatus'] : false,
    );
  }
}

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Customer>> getCustomers() async {
    QuerySnapshot customerSnapshot = await _firestore.collection('users').get();
    return customerSnapshot.docs.map((doc) => Customer.fromDocumentSnapshot(doc)).toList();
  }
}

class CustomerTable extends StatefulWidget {
  @override
  _CustomerTableState createState() => _CustomerTableState();
}

class _CustomerTableState extends State<CustomerTable> {
  late Future<List<Customer>> _customerListFuture;

  @override
  void initState() {
    super.initState();
    _customerListFuture = UserService().getCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _customerListFuture,
      builder: (context, AsyncSnapshot<List<Customer>> snapshot) {
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
