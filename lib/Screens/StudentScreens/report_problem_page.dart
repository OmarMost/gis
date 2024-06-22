import 'dart:async'; //to Timer Fun

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gis/Screens/StudentScreens/last_report_problem.dart';
//image
import 'dart:io'; //to turn File
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart'; //to turn on basename

import 'package:intl/intl.dart'; // to DateFormat

class ReportAProblem extends StatefulWidget {
  final String BuildingName, FloorNum;
  ReportAProblem(
      {super.key, required this.BuildingName, required this.FloorNum});

  @override
  State<ReportAProblem> createState() => _ReportAProblemState();
}

class _ReportAProblemState extends State<ReportAProblem> {
  final description_Controller = TextEditingController();
  //image
  final user = FirebaseAuth.instance.currentUser!;
  //To hold img
  File? imageReport;
  //To handle all the function of the lib(Image picker)
  final reportimagepicker = ImagePicker();
  //To store the url of the uploaded image
  var image_report_url = "";

  String State = "No Response Yet ..";
  get type => "Report A Problem";
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
      'ReportImage': image_report_url,
      'lat': lat,
      'long': long,
      'Date': formattedDate,
      'Time': formattedTime,
      'Email': dat['Email']
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
        this.context,
        MaterialPageRoute(
          builder: (context) => ReportProblemPage(
            id: RID!,
          ),
        ),
      );
    });
  }

  // final userr = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic> dat = {};
  getdat() {
    dat.clear();
    FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: user!.email)
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

  //toImage
  String? profiledoc;
  getprofiledoc() {
    FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: user!.email)
        .get()
        .then((value) => value.docs.forEach((element) {
              profiledoc = element.reference.id;

              print("---------------------------------------");
              print(profiledoc);
            }));
  }

  Future uploadReportImage() async {
    getprofiledoc();

    //To open the camera
    var pickedimage =
        await reportimagepicker.pickImage(source: ImageSource.camera);

    if (pickedimage != null) {
      setState(() {
        imageReport = File(pickedimage.path);
      });

      var imagesreportname = basename(pickedimage.path);

      var reportimagerefstorage =
          FirebaseStorage.instance.ref().child(imagesreportname);

      var uploadTask = reportimagerefstorage.putFile(imageReport!);
      await uploadTask.whenComplete(() async {
        image_report_url = await reportimagerefstorage.getDownloadURL();
        print(image_report_url);

        CircularProgressIndicator(
          value: 1,
        );
      });
    } else {}
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
        // Wrap with SingleChildScrollView
        padding: const EdgeInsets.all(16.0),
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
            SizedBox(height: 40.0),
            Text(
              'Provide all details about the problem you faced',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            SizedBox(height: 16.0),
            Container(
              color: Colors.grey[300], // Background color to gray
              child: TextField(
                controller: description_Controller,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Description',
                ),
              ),
            ),
            SizedBox(height: 25.0),
            //====================================================================================================
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Attach An Image",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10), // Adjust the height as needed
                  GestureDetector(
                    onTap: uploadReportImage,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: dat['ReportImage'] != null
                          ? NetworkImage(dat['ReportImage'])
                          : NetworkImage(
                              'https://firebasestorage.googleapis.com/v0/b/project-campus-8579a.appspot.com/o/Attach%20image%20here%20last.png?alt=media&token=1ace4ca2-ed06-4d2c-bd39-5e23726e85d6'),
                    ),
                  ),
                ],
              ),
            ),
            //====================================================================================================
            SizedBox(height: 120.0), //Last 290 - 50
            Center(
              child: SizedBox(
                width: 300, // width of button
                child: ElevatedButton(
                  onPressed: () {
                    // Handle 'Submit' button click
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
