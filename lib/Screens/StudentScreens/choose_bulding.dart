import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gis/Screens/StudentScreens/choose_floore.dart';
import 'package:gis/Screens/StudentScreens/first_aid_page.dart';
import 'package:gis/Screens/StudentScreens/report_problem_page.dart';
import 'package:gis/Screens/StudentScreens/sos_page.dart';
import 'package:intl/intl.dart'; // to DateFormat

class Building extends StatefulWidget {
  final String type;
  Building({super.key, required this.type}); //LAST EDIT GAMMAL

  @override
  State<Building> createState() => _BuildingState();
}

class _BuildingState extends State<Building> {
  String BuildingName = "";
  String? RIDSOS;
  get typeReport => "SOS";
  String Description = "";
  String image_report_url = "";
  String State = "No Response Yet ..";

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
      'Type': typeReport,
      'State': State,
      'RID': RIDSOS,
      'BuildingName': BuildingName,
      'FloorNum': "",
      'Description': Description,
      'ReportImage': image_report_url,
      'lat': lat,
      'long': long,
      'Date': formattedDate,
      'Time': formattedTime
      //without ( 'Floor Num': "" )
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
          builder: (context) => SOSPage(id: RIDSOS!,),
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
        title: Text('Select the building'),
      ),
      body: Column(
        children: [
          // الصف الأول
          // مبني قاعات المحاضرات
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  //LAST EDIT GAMMAL
                  if (widget.type == 'sos') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              floor(type: 'sos', BuildingName: 'Lectures',),
                        ));
                  } else if (widget.type == 'problem') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              floor(type: 'problem', BuildingName: 'Lectures'),
                        ));
                  }
                  if (widget.type == 'first aid') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => floor(
                              type: 'first aid', BuildingName: 'Lectures'),
                        ));
                  }
                },
                child: Container(
                  height: 276,
                  width: 410,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/Buld1.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // لصف الثاني

          Row(
            children: [
              SizedBox(
                width: 1,
              ),
              // مبني السكاشن
              GestureDetector(
                onTap: () {
                  //LAST EDIT GAMMAL
                  if (widget.type == 'sos') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              floor(type: 'sos', BuildingName: 'Sections'),
                        ));
                  } else if (widget.type == 'problem') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              floor(type: 'problem', BuildingName: 'Sections'),
                        ));
                  }
                  if (widget.type == 'first aid') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => floor(
                              type: 'first aid', BuildingName: 'Sections'),
                        ));
                  }
                },
                child: Container(
                  height: 289,
                  width: 98,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/buld3.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              Column(
                children: [
                  // كافتريا 1
                  GestureDetector(
                    onTap: () {
                      //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        BuildingName = "Cafe 1";
                        addDat(); //=========================================
                      } else if (widget.type == 'problem') {
                        BuildingName = "Cafe 1";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportAProblem(
                                BuildingName: 'Cafe 1',
                                FloorNum: '',
                              ),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        BuildingName = "Cafe 1";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstAid(
                                BuildingName: 'Cafe 1',
                                FloorNum: '',
                              ),
                            ));
                      }
                      // هنا مفيش ادوار
                    },
                    child: Container(
                      height: 129,
                      width: 64,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld5.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  // كافتريا 2
                  GestureDetector(
                    onTap: () {
                      //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        BuildingName = "Cafe 2";
                        addDat(); //=========================================
                      } else if (widget.type == 'problem') {
                        BuildingName = "Cafe 2";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportAProblem(
                                BuildingName: 'Cafe 2',
                                FloorNum: '',
                              ),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        BuildingName = "Cafe 2";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstAid(
                                BuildingName: 'Cafe 2',
                                FloorNum: '',
                              ),
                            ));
                      }
                      // هنا مفيش ادوار
                    },
                    child: Container(
                      height: 158,
                      width: 64,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld6.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // حرم الجامعه
                  GestureDetector(
                    onTap: () {
                      //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        BuildingName = "Campus";
                        addDat(); //=========================================
                      } else if (widget.type == 'problem') {
                        BuildingName = "Campus";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportAProblem(
                                BuildingName: 'Campus',
                                FloorNum: '',
                              ),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        BuildingName = "Campus";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstAid(
                                BuildingName: 'Campus',
                                FloorNum: '',
                              ),
                            ));
                      }
                      // هنا مفيش ادوار
                    },
                    child: Container(
                      height: 295,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld9.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // كافتريا 3
                  GestureDetector(
                    onTap: () {
                      //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        BuildingName = "Cafe 3";
                        addDat(); //=========================================
                      } else if (widget.type == 'problem') {
                        BuildingName = "Cafe 3";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportAProblem(
                                BuildingName: 'Cafe 3',
                                FloorNum: '',
                              ),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        BuildingName = "Cafe 3";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstAid(
                                BuildingName: 'Cafe 3',
                                FloorNum: '',
                              ),
                            ));
                      }
                      // هنا مفيش ادوار
                    },
                    child: Container(
                      height: 158,
                      width: 67,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld7.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),

                  //كافتريا 4
                  GestureDetector(
                    onTap: () {
                      //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        BuildingName = "Cafe 4";
                        addDat(); //=========================================
                      } else if (widget.type == 'problem') {
                        BuildingName = "Cafe 4";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportAProblem(
                                BuildingName: 'Cafe 4',
                                FloorNum: '',
                              ),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        BuildingName = "Cafe 4";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstAid(
                                BuildingName: 'Cafe 4',
                                FloorNum: '',
                              ),
                            ));
                      }
                      // هنا مفيش ادوار
                    },
                    child: Container(
                      height: 126,
                      width: 67,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld8.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // مبني اللابات
              GestureDetector(
                onTap: () {
                  //LAST EDIT GAMMAL
                  if (widget.type == 'sos') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              floor(type: 'sos', BuildingName: 'Labs'),
                        ));
                  } else if (widget.type == 'problem') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              floor(type: 'problem', BuildingName: 'Labs'),
                        ));
                  }
                  if (widget.type == 'first aid') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              floor(type: 'first aid', BuildingName: 'Labs'),
                        ));
                  }
                },
                child: Container(
                  height: 287,
                  width: 110,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/buld4.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // الصفف الثالث
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // المبني الاداري
              GestureDetector(
                onTap: () {
                  //LAST EDIT GAMMAL
                  if (widget.type == 'sos') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              floor(type: 'sos', BuildingName: 'Main'),
                        ));
                  } else if (widget.type == 'problem') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              floor(type: 'problem', BuildingName: 'Main'),
                        ));
                  }
                  if (widget.type == 'first aid') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              floor(type: 'first aid', BuildingName: 'Main'),
                        ));
                  }
                },
                child: Container(
                  height: 183,
                  width: 410,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/buld2.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
