import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> disableUserAccount(String uid) async {
  // Update the user document in Firestore to disable the account
  await FirebaseFirestore.instance.collection('users').doc(uid).update({
    'disabled': true,
  });
}
