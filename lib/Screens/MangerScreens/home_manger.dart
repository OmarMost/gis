import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gis/Screens/MangerScreens/homeMFIRST.dart';
import 'package:gis/Screens/MangerScreens/homeMPROBLEM.dart';
import 'package:gis/Screens/MangerScreens/homeMSOS.dart';
import 'package:gis/Screens/MangerScreens/reportFirstAIDMAN.dart';
import 'package:gis/Screens/MangerScreens/reportPROMANGER.dart';
import 'package:gis/Screens/MangerScreens/reportSOSMANGER.dart';
import 'package:gis/Screens/SecurtyScreens/reportSOS.dart';
import 'package:gis/Screens/onboarding_Screens/on_boarding.dart';

String? R_ID;
String? titel;
String? description;
String? sec_name;

class Home_Manger extends StatefulWidget {
  @override
  _Home_MangerState createState() => _Home_MangerState();
}

class _Home_MangerState extends State<Home_Manger> {
  TextEditingController searchController = TextEditingController();
  String searchDate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 148, 161),
      appBar: AppBar(
        title: Text(
          'All Reports',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 133, 148, 161),
        leading: IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Onboarding(),
                  ));
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/name.png', // اسم ومسار الصورة في مجلد الأصول
                  width: 250,
                  height: 50,
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(33, 1, 1, 1),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Icon(
                      Icons.search,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search for report by date (DD-MM-YYYY)',
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchDate = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView( //لتفعيل الاسكول الافقي
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home_Manger()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800]),
                    child: Text(
                      'See All ',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home_MangerS()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text(
                      'SOS',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home_MangerF()));
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: Text(
                      'First Aid',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home_MangerP()));
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                    child: Text(
                      'Problems',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Reports')
                      .orderBy('Date')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final reports = snapshot.data!.docs;

                      // هناااا الشرط الي هنحدد فيه الريبورتات الي هتتعرض
                      final filteredReports = reports
                          .where((report) => report['Type'] != 'oz')
                          .where((report) => searchDate.isEmpty || report['Date'].toString().contains(searchDate))
                          .toList();

                      return ListView.builder(
                        reverse: true,
                        itemCount: filteredReports.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final report = filteredReports[index];
                          return Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.7),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20.0),
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'Report ID : ${report['RID']}',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${report['Type']}',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: report['Type'] ==
                                              'Report A Problem'
                                          ? Colors.blue
                                          : report['Type'] == 'SOS'
                                              ? Colors.red
                                              : report['Type'] == 'First Aid'
                                                  ? Colors.green
                                                  : Colors.grey[800],
                                    ),
                                  ),
                                  ///////////////////
                                  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text(
                                          '${report['Username']}',
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  ////////////////
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Date :${report['Date']}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Text(
                                          '            State :',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        child: '${report['State']}' ==
                                                "No Response Yet .."
                                            ? Image.asset(
                                                'assets/notfinshed.png')
                                            : Image.asset('assets/finshed.png'),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Time :${report['Time']}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          if (report['Type'] == 'SOS') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => ReportSOSm(
                                                    buildingName:
                                                        '${report['BuildingName']}',
                                                    floorNumber:
                                                        '${report['FloorNum']}',
                                                    userid:
                                                        '${report['UserID']}',
                                                    name:
                                                        '${report['Username']}',
                                                    phoneNumber:
                                                        '${report['PhoneNum']}',
                                                    reportId:
                                                        '${report['RID']}',
                                                    reporttype:
                                                        '${report['Type']}',
                                                    time: '${report['Time']}',
                                                    Date: '${report['Date']}',
                                                    state: '${report['State']}',
                                                    Descriotion:
                                                        '${report['Description']}',
                                                    Photo: '${report['Type']}',
                                                    lat: report['lat'],
                                                    long: report['long']),
                                              ),
                                            );
                                          } else if (report['Type'] ==
                                              'First Aid') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ReportFIRSTAIDm(
                                                  buildingName:
                                                      '${report['BuildingName']}',
                                                  floorNumber:
                                                      '${report['FloorNum']}',
                                                  userid: '${report['UserID']}',
                                                  name: '${report['Username']}',
                                                  phoneNumber:
                                                      '${report['PhoneNum']}',
                                                  reportId: '${report['RID']}',
                                                  reporttype:
                                                      '${report['Type']}',
                                                  time: '${report['Time']}',
                                                  Date: '${report['Date']}',
                                                  State: '${report['State']}',
                                                  Descriotion:
                                                      '${report['Description']}',
                                                  Photo: '${report['Type']}',
                                                  hasChronicDiseases:
                                                      '${report['hasChronicDiseases']}',
                                                  isReportingForSelf:
                                                      '${report['isReportingForSelf']}',
                                                  lat: report['lat'],
                                                  long: report['long'],
                                                ),
                                              ),
                                            );
                                          } else if (report['Type'] ==
                                              'Report A Problem') {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ReportBROBLEMSm(
                                                  buildingName:
                                                      '${report['BuildingName']}',
                                                  floorNumber:
                                                      '${report['FloorNum']}',
                                                  userid: '${report['UserID']}',
                                                  name: '${report['Username']}',
                                                  phoneNumber:
                                                      '${report['PhoneNum']}',
                                                  reportId: '${report['RID']}',
                                                  reporttype:
                                                      '${report['Type']}',
                                                  Date: '${report['Date']}',
                                                  time: '${report['Time']}',
                                                  State: '${report['State']}',
                                                  Description:
                                                      '${report['Description']}',
                                                  Photo:
                                                      '${report['ReportImage']}',
                                                  lat: report['lat'],
                                                  long: report['long'],
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: Text(
                                          'See More Details',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                          strokeWidth: 8,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}