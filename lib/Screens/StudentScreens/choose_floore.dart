import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gis/Screens/StudentScreens/first_aid_page.dart';
import 'package:gis/Screens/StudentScreens/report_problem_page.dart';
import 'package:gis/Screens/StudentScreens/sos_page.dart';
import 'package:intl/intl.dart'; // to DateFormat

class floor extends StatefulWidget {
  final String type, BuildingName;
  floor(
      {super.key,
      required this.type,
      required this.BuildingName}); //LAST EDIT GAMMAL

  @override
  State<floor> createState() => _floorState();
}

class _floorState extends State<floor> {
  String FloorNum = "";
  String State = "No Response Yet ..";
  String? RIDSOS;
  get typeReport => "SOS";
  String Description = "";
  String image_report_url = '';

  Future addDat() async {
    // current date and time
    DateTime now = DateTime.now();

    // Customize data format
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    DateFormat timeFormat = DateFormat('HH:mm:ss');

    String formattedDate = dateFormat.format(now);
    String formattedTime = timeFormat.format(now);

    FirebaseFirestore.instance.collection('Reports').add({
      'Username': dat['Name'],
      'UserID': dat['ID'],
      'PhoneNum': dat['Phone'],
      'State': State,
      'Type': typeReport,
      'RID': RIDSOS,
      'BuildingName': widget.BuildingName,
      'FloorNum': FloorNum,
      'Description': Description,
      'ReportImage': image_report_url,
      'lat': lat,
      'long': long,
      'Date': formattedDate,
      'Time': formattedTime,
      'Email': dat['Email'],
      'securityName': ""
    }) //Make ID
        .then((documentReference) {
      setState(() {
        RIDSOS = documentReference.id;
      });
      print('Document added with ID: ${documentReference.id}');
    }).catchError((error) {
      print('Error adding document: $error');
    });
    await Timer(Duration(seconds: 2), () {
      AlertDialog(
        backgroundColor: Colors.transparent,
        content: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SOSPage(
            id: RIDSOS!,
          ),
        ),
      );
    });
  }

  final userr = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic> dat = {};
  getdat() {
    dat.clear();
    FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: userr.email)
        .get()
        .then((value) => value.docs.forEach((element) {
              dat.addAll(element.data());

              print("-------------------------------------");
              print(dat);
              print('data usersssssssssssssssss');
            }));
  }

// assiging var for lat and long to store the location
  late double lat = 0;
  late double long = 0;
  String locationmessage = 'Current User Location';
  getloc() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    print('--------------------Hello Initstate----------------------------');
    getloc().then((value) {
      lat = value.latitude;
      long = value.longitude;
      print(lat);
      print(long);
      print("-----------------------looooooong--$lat------------");
      print("-------laaaaaaaaaaaaaaaaaaat----$long--------------------------");
    });
    setState(() {
      locationmessage = 'Latitude :$lat , longitude : $long';
      print(locationmessage);
    });

    getdat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Please select a floor:',
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150,
          ),
          Center(
            child: Container(
              width: 300.0, // width of the frame
              padding: EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        FloorNum = "3";
                        addDat(); //=========================================
                        print('Senttttttttttttt');
                      } else if (widget.type == 'problem') {
                        FloorNum = "3";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportAProblem(
                                  BuildingName: widget.BuildingName,
                                  FloorNum: '3'),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        FloorNum = "3";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstAid(
                                  BuildingName: widget.BuildingName,
                                  FloorNum: '3'),
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                      ),
                      minimumSize: Size(300.0, 60.0), // Width and height
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        FloorNum = "2";
                        addDat(); //=========================================
                        print('Senttttttttttttt');
                      } else if (widget.type == 'problem') {
                        FloorNum = "2";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportAProblem(
                                  BuildingName: widget.BuildingName,
                                  FloorNum: '2'),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        FloorNum = "2";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstAid(
                                  BuildingName: widget.BuildingName,
                                  FloorNum: '2'),
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      minimumSize: Size(300.0, 60.0), // Width and height
                    ),
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        FloorNum = "1";
                        addDat(); //=========================================
                        print('Senttttttttttttt');
                      } else if (widget.type == 'problem') {
                        FloorNum = "1";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportAProblem(
                                  BuildingName: widget.BuildingName,
                                  FloorNum: '1'),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        FloorNum = "1";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstAid(
                                  BuildingName: widget.BuildingName,
                                  FloorNum: '1'),
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      minimumSize: Size(300.0, 60.0), // Width and height
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        FloorNum = "Ground floor";
                        addDat(); //=========================================
                        print('Senttttttttttttt');
                      } else if (widget.type == 'problem') {
                        FloorNum = "Ground floor";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportAProblem(
                                  BuildingName: widget.BuildingName,
                                  FloorNum: 'Ground floor'),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        FloorNum = "Ground floor";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstAid(
                                  BuildingName: widget.BuildingName,
                                  FloorNum: 'Ground floor'),
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                      ),
                      minimumSize: Size(300.0, 60.0), // Width and height
                    ),
                    child: Text(
                      'Ground floor',
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
