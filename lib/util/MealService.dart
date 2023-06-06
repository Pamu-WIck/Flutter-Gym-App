import 'package:cloud_firestore/cloud_firestore.dart';

class MealService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addMeal(String customerId, String breakfast, String lunch, String dinner) async {
    try {
      await _firestore.collection('meals').add({
        'customerId': customerId,
        'breakfast': breakfast,
        'lunch': lunch,
        'dinner': dinner,
      });
    } catch (e) {
      print('Error adding meal: $e');
      throw e;
    }
  }
}
