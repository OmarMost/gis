import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/LoginScreens/loginScreen.dart';
import 'package:gis/Screens/MangerScreens/home_manger.dart';
import 'package:gis/Screens/SecurtyScreens/homesecurtySOS.dart';
import 'package:gis/Screens/StudentScreens/help.dart';
import 'package:gis/Screens/StudentScreens/last_first_aid.dart';
import 'package:gis/Screens/SecurtyScreens/map.dart'; //to test map
import '../StudentScreens/student_home.dart'; //By Elgammal
import 'on_boarding2.dart';

class Onboarding extends StatelessWidget {
  final Key? key; // Named 'key' parameter added to the constructor

  const Onboarding({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/LogoPNG.png'),
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),),
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
                    // Test Button ___
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // FirebaseAuth.instance.signOut();
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => Home_Manger(),
                    //         ));
                    //   },
                    //   child: Text(
                    //     'Test Button',
                    //     style: TextStyle(
                    //         color: Colors.black, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                  ],
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
