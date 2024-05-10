import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gis/Screens/StudentScreens/last_first_aid.dart';
import 'package:intl/intl.dart'; // to DateFormat

class FirstAid extends StatefulWidget {
  final String BuildingName, FloorNum;
  FirstAid({super.key, required this.BuildingName, required this.FloorNum});

  @override
  State<FirstAid> createState() => _FirstAidState();
}

class _FirstAidState extends State<FirstAid> {
  final description_Controller = TextEditingController();

  // Variables of radio buttons
  bool isReportingForSelf = true; // Default is "For Me"
  bool hasChronicDiseases = false; // Default is "No"
  String State = "No Response Yet ..";
  get type => "First Aid";
  String? RID;
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
      'PhoneNum': dat['Phone'],
      'UserID': dat['ID'],
      'Type': type,
      'RID': RID,
      'BuildingName': widget.BuildingName,
      'FloorNum': widget.FloorNum,
      'State': State,
      'Description': description_Controller.text,
      'isReportingForSelf': isReportingForSelf,
      'hasChronicDiseases': hasChronicDiseases,
      'lat': lat,
      'long': long,
      'Date': formattedDate,
      'Time': formattedTime
    }) //Make ID
        .then((documentReference) {
      setState(() {
        RID = documentReference.id;
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
          builder: (context) => FirstAidpage(id: RID!,),
        ),
      );
    });
  }

  final user = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic> dat = {};
  getdat() {
    dat.clear();
    FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: user.email)
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30.0),
            Text(
              'First Aid',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 40.0),
            Text(
              'Stay Calm We are Here to Help !',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 20.0),
            //First Question
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              children: [
                Text(
                  '- Are you reporting for you or someone else ?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            //End First Question, then Radio >>
            Column(
              children: [
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: isReportingForSelf,
                      onChanged: (value) {
                        setState(() {
                          isReportingForSelf = value!;
                        });
                      },
                    ),
                    Text('For Me'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: isReportingForSelf,
                      onChanged: (value) {
                        setState(() {
                          isReportingForSelf = value!;
                        });
                      },
                    ),
                    Text('Someone Else'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            //Second Question
            Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              children: [
                Text(
                  '- Any Chronic Diseases ?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            //End Second Question, then Radio >>
            Column(
              children: [
                Row(
                  children: [
                    Radio(
                      value: true,
                      groupValue: hasChronicDiseases,
                      onChanged: (value) {
                        setState(() {
                          hasChronicDiseases = value!;
                        });
                      },
                    ),
                    Text('Yes'),
                  ],
                ),
                Row(
                  children: [
                    Radio(
                      value: false,
                      groupValue: hasChronicDiseases,
                      onChanged: (value) {
                        setState(() {
                          hasChronicDiseases = value!;
                        });
                      },
                    ),
                    Text('No'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            //More Details Section ..
            Row(
              children: [
                Text(
                  'Details about your case :',
                  style: TextStyle(
                    fontSize: 21.0,
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.grey[300],
              child: TextField(
                controller: description_Controller,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 45.0),
            Center(
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle 'Submit' button
                    addDat();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  child: Text(
                    'Submit',
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
}
