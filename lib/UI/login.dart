import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jail_fitness/auth.dart';
import 'package:jail_fitness/ui/home_page.dart';
import 'package:jail_fitness/UI/getUserData.dart';

class loginUI extends StatefulWidget {
  const loginUI({Key? key}) : super(key: key);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<loginUI> {
  final _auth = Auth();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? errorMessage = '';
  bool isLogin = true;

  Future<void> signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserForm()),
      );
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF20202C),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //logo
          SvgPicture.asset(
            'assets/images/login/login.svg',
            semanticsLabel: 'Example SVG', // Optional
            width: 200,
            height: 200,
          ),

          //email textfield
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Email',
                    hintText: 'Enter valid email id',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                ),

                //password textfield
                SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                    labelStyle: TextStyle(color: Colors.white),
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                ),

                SizedBox(height: 10),
                Text(
                  errorMessage ?? '',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),

                //login button with #AE6FF2 and #795EF1 gradient
                SizedBox(height: 20),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 183, 107, 214),
                        Color.fromARGB(255, 106, 52, 232),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: isLogin
                        ? signInWithEmailAndPassword
                        : createUserWithEmailAndPassword,
                    child: Text(
                      isLogin ? 'Login' : 'Register',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),

                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin
                        ? 'Need an account? Register'
                        : 'Already have an account? Login',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
