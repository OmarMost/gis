import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ReportSOS extends StatefulWidget {
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
  final String lat;
  final String long;

  final String time;

  ReportSOS(
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
      required this.long});

  @override
  State<ReportSOS> createState() => _ReportSOSState();
}

class _ReportSOSState extends State<ReportSOS> {
  Future<void> openmap(String lat, String long) async {
    String googleurl =
        'https://www.google.com/maps/search/?api=1&query=$lat,$long';
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
                Icon(Icons.access_time),
                SizedBox(width: 8),
                Text(widget.time,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 8),
                Text(widget.lat, style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on),
                SizedBox(width: 8),
                Text(widget.long,
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            ElevatedButton.icon(
                onPressed: () => openmap,
                icon: Icon(Icons.map),
                label: Text('See Location')),
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
                onPressed: () {},
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
