import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportBROBLEMS extends StatelessWidget {
  final String name;
  final String userid;
  final String phoneNumber;
  final String reporttype;
  final String reportId;
  final String Descriotion;
  final String buildingName;
  final String floorNumber;
  final String? Photo;
  final String State;
  final String time;
  String? Reportdoc;

  ReportBROBLEMS({
    required this.State,
    required this.reporttype,
    required this.reportId,
    required this.name,
    required this.Descriotion,
    required this.userid,
    required this.phoneNumber,
    required this.buildingName,
    required this.floorNumber,
    required this.Photo,
    required this.time,
  });

  void updateStateToX() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    FirebaseFirestore.instance
        .collection('Reports')
        .doc(Reportdoc)
        .update({'State': "Responded"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 251, 246, 246),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 251, 246, 246),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              reporttype,
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Report ID : $reportId',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.person),
                SizedBox(width: 8),
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.quick_contacts_mail_outlined),
                SizedBox(width: 8),
                Text(
                  'ID : $userid',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.phone),
                SizedBox(width: 8),
                Text(
                  "Phone : $phoneNumber",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.business),
                SizedBox(width: 8),
                Text(
                  'Building  : $buildingName',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.layers),
                SizedBox(width: 8),
                Text(
                  'Floor Number  : $floorNumber',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 8),
                Text(
                  time,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.add_task_rounded),
                SizedBox(width: 8),
                Text(
                  State,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Photo != null? 
                Image(
                  image: NetworkImage(Photo!),
                  width: 250,
                  height: 230,
                ) : Text("No Photo Taken")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: State == "No Response Yet .."
                      ? Image.asset('assets/False.jpg')
                      : Image.asset('assets/True.jpg'),
                ),
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.orangeAccent,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                onPressed: () {
                  updateStateToX();
                },
                child: Text(
                  'Respond',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
