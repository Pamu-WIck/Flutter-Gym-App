// managePayment.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class ManagePayment {
  static Future<void> updatePaymentStatus(String uid, bool paidStatus) async {
    // Update the user document in Firestore to update the paidStatus
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'paidStatus': paidStatus,
    });
  }
}
