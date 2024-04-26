import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/StudentScreens/last_report_problem.dart';

class ReportAProblem extends StatefulWidget {
  // const ReportAProblem({Key? key}) : super(key: key);
  final String BuildingName, FloorNum;
  ReportAProblem(
      {super.key, required this.BuildingName, required this.FloorNum});

  @override
  State<ReportAProblem> createState() => _ReportAProblemState();
}

class _ReportAProblemState extends State<ReportAProblem> {
  final description_Controller = TextEditingController();

  int RID = 1;
  // get RID => '1';
  get type => "Report A Problem";

  Future addDat() async {
    FirebaseFirestore.instance.collection('Reports').add({
      'Username': dat['Name'],
      'PhoneNum': dat['Phone'],
      'Type': type,
      'RID': RID,
      'BuildingName': widget.BuildingName,
      'FloorNum': widget.FloorNum,
      'Description': description_Controller.text
    });

    setState(() {
      RID++;
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
            Row(
              children: [
                Icon(Icons.camera_alt, size: 30.0),
                SizedBox(width: 8.0),
                Text(
                  'Attach an Image',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 240.0), //Last 290 - 50
            Center(
              child: SizedBox(
                width: 300, // width of button
                child: ElevatedButton(
                  onPressed: () {
                    // Handle 'Submit' button click
                    addDat();
                    print('Senttttttttttttt');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportProblemPage(),
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
