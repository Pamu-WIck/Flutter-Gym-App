import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  final String uid;
  final String username;
  final int age;
  final double weight;
  final bool paidStatus;
  final bool? isAdmin;

  Customer({
    required this.uid,
    required this.username,
    required this.age,
    required this.weight,
    required this.paidStatus,
    this.isAdmin,
  });

  factory Customer.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
    return Customer(
      uid: documentSnapshot.id,
      username: data['username'],
      age: data['age'],
      weight: data['weight'],
      paidStatus: data.containsKey('paidStatus') ? data['paidStatus'] : false,
      isAdmin: data['admin'] as bool?,
    );
  }
}
