import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jail_fitness/UI/manageCustomers.dart';
import 'package:jail_fitness/UI/payment.dart';
import 'package:jail_fitness/UI/progress.dart';
import 'package:jail_fitness/res/colors.dart';
import 'package:jail_fitness/util/home_page_card.dart';
import 'package:jail_fitness/util/home_tile.dart';
import 'package:jail_fitness/auth.dart';
import 'dailyActivity.dart';
import 'package:jail_fitness/userData.dart';
import 'package:jail_fitness/pages/home_page.dart';
import 'package:jail_fitness/UI/addMealPlan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;

  String userID = Auth().currentUser!.uid;
  String username = '';
  late bool isAdmin = false;

  @override
  void initState() {
    super.initState();
    _fetchIsAdmin();
  }

  Future<void> _fetchIsAdmin() async {
    bool isAdminResult = await fetchIsAdmin();
    setState(() {
      isAdmin = isAdminResult;
    });
  }

  Future<String> fetchUsername() async {
    String userID = Auth().currentUser!.uid;
    UserService userService = UserService();
    UserModel user = await userService.getUser(userID);
    return user.username;
  }

  Future<bool> fetchIsAdmin() async {
    String userID = Auth().currentUser!.uid;
    UserService userService = UserService();
    UserModel user = await userService.getUser(userID);
    return user.admin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(child: _buildBody(context)),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 20),
          _buildGreeting(),
          OverlappingImageCard(),
          const SizedBox(height: 20),
          _buildTiles(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
        Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LogOut()),
            );
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.logout,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGreeting() {
    return FutureBuilder<String>(
      future: fetchUsername(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        String greeting = 'Loading...';
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            greeting = 'Error: ${snapshot.error}';
          } else {
            greeting = 'Hello ${snapshot.data ?? 'User'}';
          }
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greeting,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '23 Jan, 2021',
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTiles(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          _buildTileRow(
            context,
            [
              {
                'title': 'Working Progress',
                'subtitle': 'Your Daily Progress of Workout',
                'icon': FontAwesomeIcons.chartGantt,
                'color': Colors.purple,
                'screen': progressUi(),
              },
              {
                'title': 'Daily Routine',
                'subtitle': 'Your Daily Routine of Workout',
                'icon': Icons.access_time,
                'color': Colors.blue,
                'screen': DailyRoutine(),
              },
            ],
          ),
          const SizedBox(height: 20),
          if (isAdmin) ...[
            _buildTileRow(
              context,
              [
                {
                  'title': 'Payment Details',
                  'subtitle': 'Your Daily Progress of Workout',
                  'icon': Icons.payment,
                  'color': Colors.orange,
                  'screen': PaymentTable(),
                },
                {
                  'title': 'Manage Customers',
                  'subtitle': 'Your Daily Progress of Workout',
                  'icon': Icons.people,
                  'color': Colors.green,
                  'screen': CustomerTable(),
                },
              ],
            ),
            const SizedBox(height: 20),
            _buildTileRow(
              context,
              [
                {
                  'title': 'Manage Meals',
                  'subtitle': 'Add meals to the system',
                  'icon': Icons.food_bank,
                  'color': Colors.orange,
                  'screen': MealTable(),
                },
              ],
            )
          ],
        ],
      ),
    );
  }

  Widget _buildTileRow(
      BuildContext context,
      List<Map<String, dynamic>> tilesData,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: tilesData.map((tileData) {
        return HomeTile(
          title: tileData['title'],
          subtitle: tileData['subtitle'],
          icon: tileData['icon'],
          color: tileData['color'],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => tileData['screen']),
            );
          },
        );
      }).toList(),
    );
  }
}
