import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gis/Screens/SecurtyScreens/location_on_map.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ReportSOSm extends StatefulWidget {
  final String name;
  final String userid;
  final String phoneNumber;
  final String reporttype;
  final String reportId;
  final String Descriotion;
  final String buildingName;
  final String floorNumber;
  final String Photo;
  final String state;
  final double lat;
  final double long;
  final String Date;
  final String time;

  ReportSOSm(
      {required this.state,
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
      required this.lat,
      required this.Date,
      required this.long});

  @override
  State<ReportSOSm> createState() => _ReportSOSState();
}

class _ReportSOSState extends State<ReportSOSm> {
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

  Future<void> openmap(String latuide, String longtuide) async {
    String googleurl =
        'https://www.google.com/maps/search/?api=1&query=$latuide,$longtuide';
    await canLaunch(googleurl)
        ? await launchUrlString(googleurl)
        : throw 'Could not launch $googleurl';
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
                Text("Phone : ${widget.phoneNumber}",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.business),
                SizedBox(width: 8),
                Text('Building  : ${widget.buildingName}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.layers),
                SizedBox(width: 8),
                Text('Floor Number  : ${widget.floorNumber}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.date_range_outlined),
                SizedBox(width: 8),
                Text(
                  "Date :${widget.Date} ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.access_time),
                SizedBox(width: 8),
                Text("Date :${widget.time} ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.add_task_rounded),
                SizedBox(width: 8),
                Text(widget.state,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 8),
                Text('LAT :${widget.lat}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 8),
                Text('LONG :${widget.long}',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.add_task_rounded),
                SizedBox(width: 8),
                Text(widget.state,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                // openmap(widget.lat, widget.long);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => locationOnMap(
                        lat: widget.lat,
                        long: widget.long,
                        type: 'SOS',
                      ),
                    ));
              },
              icon: Icon(
                Icons.map,
                color: Colors.red,
              ),
              label: Text('See Location',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.red)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: widget.state == "No Response Yet .."
                      ? Image.asset('assets/False.jpg')
                      : Image.asset('assets/True.jpg'),
                ),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
