import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:gis/Screens/SecurtyScreens/location_on_map.dart';

class ReportBROBLEMSm extends StatefulWidget {
  final String name;
  final String userid;
  final String phoneNumber;
  final String reporttype;
  final String reportId;
  final String Description;
  final String buildingName;
  final String floorNumber;
  final String? Photo;
  final String State;
  final String time;
  final String Date;
  final double lat;
  final double long;

  ReportBROBLEMSm(
      {required this.State,
      required this.reporttype,
      required this.reportId,
      required this.name,
      required this.Description,
      required this.userid,
      required this.phoneNumber,
      required this.buildingName,
      required this.floorNumber,
      required this.Photo,
      required this.time,
      required this.Date,
      required this.lat,
      required this.long});

  @override
  _ReportBROBLEMSState createState() => _ReportBROBLEMSState();
}

class _ReportBROBLEMSState extends State<ReportBROBLEMSm> {
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
      body: CustomScrollView(
        //Enable Scroll من أخوك الجمّال
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.reporttype,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
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
                      Text(
                        "Time :${widget.time} ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
                      Icon(Icons.textsms_rounded),
                      SizedBox(width: 8),
                      Text(
                        "Description :${widget.Description} ",
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
                        "State :${widget.State} ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
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
                                type: 'problem',
                              ),
                            ));
                      },
                      icon: Icon(
                        Icons.map,
                        color: Colors.blue,
                      ),
                      label: Text('See Location',
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold))),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
