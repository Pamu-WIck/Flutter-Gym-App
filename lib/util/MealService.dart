import 'package:cloud_firestore/cloud_firestore.dart';

class MealService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addMeal(
      String customerId, String breakfast, String lunch, String dinner) async {
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

  Future<Map<String, dynamic>> getMealForUser(String customerId) async {
    try {
      QuerySnapshot mealSnapshot = await _firestore
          .collection('meals')
          .where('customerId', isEqualTo: customerId)
          .limit(1) // only get the first document
          .get();

      if (mealSnapshot.docs.isEmpty) {
        return {
          'message': 'No meals',
        }; // return a map with a message if no meals found or if user does not exist
      } else {
        return mealSnapshot.docs.first.data() as Map<String, dynamic>;
      }
    } catch (e) {
      print('Error getting meals: $e');
      throw e;
    }
  }

  Future<void> resetMeals() async {
    try {
      // Get all the meal documents
      QuerySnapshot mealSnapshot = await _firestore.collection('meals').get();

      // Delete each meal document
      for (var doc in mealSnapshot.docs) {
        await doc.reference.delete();
      }

      print('Meals reset successfully.');
    } catch (e) {
      print('Error resetting meals: $e');
      throw e;
    }
  }
}
