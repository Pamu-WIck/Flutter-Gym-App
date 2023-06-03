// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:jail_fitness/UI/home_page.dart';
// import 'package:jail_fitness/UI/login.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Introduction Screen Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: IntroScreen(),
//     );
//   }
// }
//
// class IntroScreen extends StatelessWidget {
//   final introKey = GlobalKey<IntroductionScreenState>();
//
//   void _onIntroEnd(BuildContext context) {
//     // Navigate to the home screen or any other desired screen
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(builder: (_) => loginUI()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const pageDecoration = const PageDecoration(
//       titleTextStyle: TextStyle(
//           fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
//       bodyTextStyle: TextStyle(fontSize: 20.0, color: Colors.white),
//       pageColor: Color(0xFF1E1A2B),
//     );
//
//     return IntroductionScreen(
//       key: introKey,
//       globalBackgroundColor: Color(0xFF1E1A2B),
//       pages: [
//         PageViewModel(
//           title: "Welcome to Jail Fitness",
//           body: "The best app for your fitness needs",
//           image: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFFAE6FF2), Color(0xFF795EF1)],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//             ),
//             child: FractionallySizedBox(
//               widthFactor: 3 / 4, // Set the width to 3/4 of the available width
//               child: Image.asset(
//                 'assets/images/intro/loading1.png',
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "Simple and Easy",
//           body: "Enjoy the simplicity of building Flutter apps.",
//           image: Center(
//             child: FractionallySizedBox(
//               widthFactor: 0.5,
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: Image.asset(
//                   'assets/images/intro/loading1.png',
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ),
//           decoration: pageDecoration,
//         ),
//         PageViewModel(
//           title: "Powerful UI",
//           body: "Create stunning and responsive user interfaces.",
//           image: Center(
//             child: FractionallySizedBox(
//               widthFactor: 0.5,
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: Image.asset(
//                   'assets/images/intro/loading1.png',
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//           ),
//           decoration: pageDecoration,
//         ),
//       ],
//       onDone: () => _onIntroEnd(context),
//       done: const Text("Get Started"),
//       showSkipButton: true,
//       skip: const Text("Skip"),
//       next: const Icon(Icons.arrow_forward),
//     );
//   }
// }
