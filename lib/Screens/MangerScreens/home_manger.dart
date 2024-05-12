import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gis/Screens/MangerScreens/reportSOSMANGER.dart';
import 'package:gis/Screens/SecurtyScreens/reportSOS.dart';

String? R_ID;
String? titel;
String? description;
String? sec_name;

class Home_Manger extends StatelessWidget {
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
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
                // decoration: BoxDecoration(
                //    borderRadius: BorderRadius.circular(5),
                //  color: Color.fromARGB(33, 1, 1, 1),
                // ),
                // child: Row(
                // children: [
                // Icon(
                //  Icons.search,
                // ),
                // SizedBox(
                // width: 10,
                // ),
                // Text(
                // 'search for report ',
                // style: TextStyle(),
                // ),
                //  ],
                // ),
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
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.bold),
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
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ReportSOSm(
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
                                                  state: '${report['State']}',
                                                  Descriotion:
                                                      '${report['Description']}',
                                                  Photo: '${report['Type']}',
                                                  lat: report['lat'],
                                                  long: report['long']),
                                            ),
                                          );
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
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.all(1.0),
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: ListView.builder(
            //             itemCount: 12,
            //             scrollDirection: Axis.horizontal,
            //             itemExtent: 200,
            //             itemBuilder: (context, index) => Padding(
            //               padding: const EdgeInsets.all(3.0),
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(10.0),
            //                   color: Color.fromARGB(255, 255, 255, 255),
            //                 ),
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Center(
            //                       child: Text(
            //                         '$sec_name',
            //                         style: TextStyle(
            //                           fontSize: 18,
            //                           fontWeight: FontWeight.bold,
            //                         ),
            //                       ),
            //                     ),
            //                     Center(
            //                       child: CircleAvatar(
            //                         radius: 50,
            //                         backgroundImage: NetworkImage(
            //                             'https://play-lh.googleusercontent.com/EX6jTQW25Tg17OrbeQJk7OjELqK0Un1RaJsYavBQKZFXMnABy2bokpHnSi2gkhVGdY9g=w240-h480-rw'),
            //                       ),
            //                     ),
            //                     SizedBox(
            //                       height: 20,
            //                       width: 60,
            //                     ),
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         Text(
            //                           'Available or busy:',
            //                           style: TextStyle(
            //                             fontSize: 19,
            //                             fontWeight: FontWeight.bold,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     Image(
            //                       width: 30,
            //                       height: 30,
            //                       image: AssetImage('assets/not_finshed.png'),
            //                     ),
            //                     SizedBox(
            //                       height: 50,
            //                     ),
            //                     Text(
            //                       'Report ID : ',
            //                       style: TextStyle(
            //                         fontSize: 20,
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 15,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}