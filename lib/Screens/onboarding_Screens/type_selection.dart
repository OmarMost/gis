import 'package:flutter/material.dart';
import 'package:gis/Screens/LoginScreens/auth_page.dart';

import 'package:gis/Screens/LoginScreens/sec_login.dart';

class Select_type extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'You Are a :',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Auth_Page()));
              },
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(55)),
                  border: Border.all(
                    color: const Color.fromARGB(255, 251, 211, 2),
                    width: 6.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/Student_logo.jpg',
                      width: 130,
                      height: 130,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      "Student",
                      style: TextStyle(
                          color: Color.fromARGB(255, 116, 89, 78),
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecLogin()));
              },
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(55)),
                  border: Border.all(
                    color: const Color.fromARGB(255, 61, 63, 68),
                    width: 6.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/sec_Logo2.jpg',
                      width: 130,
                      height: 130,
                    ),
                    const SizedBox(
                        height: 8.0), // Add space between image and text
                    Text(
                      "Security",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0), //Add Space
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
