import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/LoginScreens/loginScreen.dart';
import 'package:gis/Screens/SecurtyScreens/home_manger.dart';
import 'package:gis/Screens/SecurtyScreens/homesecurtySOS.dart';
import 'package:gis/Screens/StudentScreens/help.dart';
import 'package:gis/Screens/StudentScreens/last_first_aid.dart';
import 'package:gis/Screens/StudentScreens/test_map.dart'; //to test map
import '../StudentScreens/student_home.dart'; //By Elgammal
import 'on_boarding2.dart';

class Onboarding extends StatelessWidget {
  final Key? key; // Named 'key' parameter added to the constructor

  const Onboarding({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Logo1.jpg'),
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to Safe Campus',
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Onboarding2()));
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
                //Changes by Elgammal to test StudentHomePage---------------------------

                ElevatedButton(
                  onPressed: () {
                    // FirebaseAuth.instance.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MTIMAP(),
                        ));
                    // Navigator.push(context,
                    //   MaterialPageRoute(builder: (context) => log));
                  },
                  child: Text(
                    'Test Button',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),

                //-----------------------------------------------------------------------
              ],
            ),
          ),
        ],
      ),
    );
  }
}
