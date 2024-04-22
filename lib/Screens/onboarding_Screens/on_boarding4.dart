import 'package:gis/Screens/onboarding_Screens/type_selection.dart';

import '../LoginScreens/auth_page.dart';
import 'package:flutter/material.dart';

class Onboarding4 extends StatelessWidget {
  final Key? key; // Named 'key' parameter added to the constructor

  const Onboarding4({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/problem.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          const Text(
            "Report a Problem",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 55),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Faced a problem? don’t hesitate  to report , our campus security team will  check it up for you and reach out to help as soon  as possible .  ",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Select_type()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.orange, fontWeight: FontWeight.bold),
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
