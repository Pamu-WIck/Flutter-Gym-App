import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import '../widgets/customerTable.dart';
import '../util/MealService.dart';

class MealTable extends StatefulWidget {
  @override
  _MealTableState createState() => _MealTableState();
}

class _MealTableState extends State<MealTable> {
  late Future<List<Customer>> _customerListFuture;
  final MealService _mealService = MealService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _breakfastController = TextEditingController();
  TextEditingController _lunchController = TextEditingController();
  TextEditingController _dinnerController = TextEditingController();

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

  void _submitMeals(String uid) {
    if (_formKey.currentState!.validate()) {
      // Get the values from the text controllers
      String breakfast = _breakfastController.text;
      String lunch = _lunchController.text;
      String dinner = _dinnerController.text;

      _mealService.addMeal(uid, breakfast, lunch, dinner).then((_) {
        // Meal plan added successfully
        // Clear the text fields
        _breakfastController.clear();
        _lunchController.clear();
        _dinnerController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Meal plan submitted successfully.'),
          ),
        );
      }).catchError((error) {
        // Error occurred while adding meal plan
        // Handle the error or show an error message
        print('Error adding meal plan: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit meal plan. Please try again.'),
          ),
        );
      });
    }
  }

  @override
  void dispose() {
    _breakfastController.dispose();
    _lunchController.dispose();
    _dinnerController.dispose();
    super.dispose();
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
                padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
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
                  children: [
                    Divider(thickness: 1.0, height: 1.0, color: Colors.white),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Age: ${customer.age}',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: _breakfastController,
                              style: TextStyle(
                                  color: Colors.white), // Set text color
                              decoration: InputDecoration(
                                labelText: 'Breakfast',
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter breakfast';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: _lunchController,
                              style: TextStyle(
                                  color: Colors.white), // Set text color
                              decoration: InputDecoration(
                                labelText: 'Lunch',
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter lunch';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: _dinnerController,
                              style: TextStyle(
                                  color: Colors.white), // Set text color
                              decoration: InputDecoration(
                                labelText: 'Dinner',
                                labelStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter dinner';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () => _submitMeals(customer.uid),
                              child: Text('Submit Meals'),
                            ),
                          ],
                        ),
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
