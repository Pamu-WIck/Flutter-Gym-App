import 'package:cloud_firestore/cloud_firestore.dart';

class AdminUpgrade {
  static Future<void> downgradeUserToNormal(String uid) async {
    // Update the user document in Firestore to downgrade the user to a normal user
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'admin': false,
    });
  }

  static Future<void> upgradeUserToAdmin(String uid) async {
    // Update the user document in Firestore to upgrade the user to an admin
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'admin': true,
    });
  }
}



