import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/StudentScreens/student_home.dart';
import 'package:url_launcher/url_launcher.dart'; //to Handle 'Call Security' button click

class SOSPage extends StatefulWidget {
  final String id;
  const SOSPage({Key? key, required this.id}) : super(key: key);

  @override
  State<SOSPage> createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 0), () {
      setState(() {
        FirebaseFirestore.instance
            .collection('Reports')
            .doc(widget.id!)
            .update({'RID': widget.id!});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StudentHome()));
            //Navigator.of(context).pushReplacement(StudentHome as Route<Object?>);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30.0),
            Text(
              'Emergency | SOS ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 70.0),
            Text(
              'Your location has been sent!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 0.0),
            Text(
              'Hang in there, help is on its way',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 441.0), //Last 491 - 50
            Center(
              child: SizedBox(
                width: 300, // width of button
                child: ElevatedButton(
                  onPressed: () {
                    // Handle 'Call Security' button click
                    _callSecurity();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0))),
                  child: Text(
                    'Call Security',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to Handle 'Call Security' button click
  void _callSecurity() async {
    const url = 'tel:+201067426719';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
