import 'package:flutter/material.dart';
import 'package:gis/Screens/SecurtyScreens/homesecurty.dart';
import 'package:gis/Screens/StudentScreens/help.dart';
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
                //Changes by Elgammal to test StudentHomePage----------------------------
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Help()));
                  },
                  child: Text(
                    'Test Button -- To StudentHomePage',
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
