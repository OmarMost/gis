import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gis/Screens/MangerScreens/home_manger.dart';
import 'package:gis/Screens/MangerScreens/reportFirstAIDMAN.dart';
import 'package:gis/Screens/MangerScreens/reportPROMANGER.dart';
import 'package:gis/Screens/MangerScreens/reportSOSMANGER.dart';
import 'package:gis/Screens/SecurtyScreens/reportSOS.dart';

String? R_ID;
String? titel;
String? description;
String? sec_name;

final user = FirebaseAuth.instance.currentUser;

Future<List<Map<String, dynamic>>> getReports() async {
  List<Map<String, dynamic>> reports = [];

  await FirebaseFirestore.instance
      .collection('Reports')
      .where('UserID', isEqualTo: user!.uid)
      .get()
      .then((value) {
    value.docs.forEach((element) {
      reports.add(element.data());
    });
  });
  return reports;
}

class Old_Reports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 148, 161),
      appBar: AppBar(
        title: Text(
          'All My Reports ',
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
                      final user = FirebaseAuth.instance.currentUser;
                      final filteredReports = reports
                          .where(
                            (report) => report['Email'] == user!.email,).toList();

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
                                      color: report['Type'] == 'Report A Problem'
                                          ? Colors.blue
                                          : report['Type'] == 'SOS'
                                              ? Colors.red
                                              : report['Type'] == 'First Aid'
                                                  ? Colors.green
                                                  : Colors.grey[800],
                                    ),
                                  ),
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        child: '${report['State']}' == "No Response Yet .."
                                            ? Image.asset('assets/notfinshed.png')
                                            : Image.asset('assets/finshed.png'),
                                      ),
                                    ],
                                  ),                                  
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Description :${report['Description']}',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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