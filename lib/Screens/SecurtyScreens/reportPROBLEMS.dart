import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportBROBLEMS extends StatefulWidget {
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

  @override
  _ReportBROBLEMSState createState() => _ReportBROBLEMSState();
}

class _ReportBROBLEMSState extends State<ReportBROBLEMS> {
  bool isResponded = true;
  bool isFirstClick = true;
  void updateStateToX() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    String newState = isFirstClick ? "In The Way" : "Responded";

    FirebaseFirestore.instance
        .collection('Reports')
        .doc(widget.reportId)
        .update({'State': newState});

    if (!isFirstClick) {
      Navigator.pop(context);
    }

    setState(() {
      isResponded = !isResponded;
      isFirstClick = false;
    });
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
              widget.reporttype,
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Report ID : ${widget.reportId}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.person),
                SizedBox(width: 8),
                Text(
                  widget.name,
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
                  'ID : ${widget.userid}',
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
                  "Phone : ${widget.phoneNumber}",
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
                  'Building  : ${widget.buildingName}',
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
                  'Floor Number  : ${widget.floorNumber}',
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
                  widget.time,
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
                  widget.State,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.Photo != ""
                    ? Image(
                        image: NetworkImage(widget.Photo!),
                        width: 250,
                        height: 230,
                      )
                    : Text("No Photo Taken !!")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: widget.State == "No Response Yet .."
                      ? Image.asset('assets/False.jpg')
                      : Image.asset('assets/True.jpg'),
                ),
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: widget.State != "Responded"
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor:
                            isResponded ? Colors.orangeAccent : Colors.green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      ),
                      onPressed: () {
                        updateStateToX();
                      },
                      child: Text(
                        isResponded ? 'In My Way ..' : 'Responded',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
