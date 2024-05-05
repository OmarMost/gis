import 'dart:async'; //to Timer Fun

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/StudentScreens/student_home.dart';

class ReportProblemPage extends StatefulWidget {
  final String id;
  const ReportProblemPage({Key? key, required this.id}) : super(key: key);


  @override
  State<ReportProblemPage> createState() => _ReportProblemPageState();
}

class _ReportProblemPageState extends State<ReportProblemPage> {
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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentHome(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center, // Center all child widgets
          child: Column(
            children: [
              SizedBox(height: 30.0),
              Text(
                'Report A Problem',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 60.0),
              Text(
                'Thanks For Reporting!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 0.0),
              Text(
                'Our Team Is Investigating',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } 
}