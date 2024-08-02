import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:ididid/pages/main_page.dart';
import 'package:ididid/utils/create_user_data.dart';
import 'package:ididid/variables/global_varibles.dart';

// Future<void> main() async {
//   await createUserData();
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     w = MediaQuery.of(context).size.width;
//     h = MediaQuery.of(context).size.height;
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: const Color(0xffffffff),
//         body: Material(
//           child: //BlackHolePage()// OnboardingPage(),//WomenPage(),// MileStonesPage(),//TestPage(),//MileStonesPage(),
//         ),
//       ),
//     );
//   }
// }

Future<void> main() async {
  await createUserData();
  runApp(const MainApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return const KeyboardDismissOnTap(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MainPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Color(0xff0E0814),
      child: Column(
        children: [
          Spacer(),
        ],
      ),
    );
  }
}
