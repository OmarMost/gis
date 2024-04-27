import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/StudentScreens/last_first_aid.dart';

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

  String? RID;
  get type => "First Aid";
  String Description = "";
  String image_report_url = "";
  Future addDat() async {
    FirebaseFirestore.instance.collection('Reports').add({
      'Username': dat['Name'],
      'PhoneNum': dat['Phone'],
      'UserID': dat['ID'],
      'Type': type,
      'RID': RID,
      'BuildingName': widget.BuildingName,
      'FloorNum': widget.FloorNum,
      'Description': description_Controller.text,
      'ReportImage': image_report_url,
      'isReportingForSelf': isReportingForSelf,
      'hasChronicDiseases': hasChronicDiseases
    }) //Make ID
        .then((documentReference) {
      setState(() {
        RID = documentReference.id;
      });
      print('Document added with ID: ${documentReference.id}');
    }).catchError((error) {
      print('Error adding document: $error');
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

  @override
  void initState() {
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
                  'Are you reporting for you or someone else?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
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
                  'Any Chronic Diseases?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
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
                  'Details about your case',
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
                    // Handle 'Submit' button click
                    addDat();
                    print('Senttttttttttttt');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FirstAidpage(),
                      ),
                    );
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
