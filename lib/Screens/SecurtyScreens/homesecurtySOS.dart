import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/SecurtyScreens/map.dart';
import 'package:gis/Screens/SecurtyScreens/profilesec.dart';
import 'package:gis/Screens/SecurtyScreens/reportFIRSTAID.dart';
import 'package:gis/Screens/SecurtyScreens/reportPROBLEMS.dart';
import 'package:gis/Screens/SecurtyScreens/reportSOS.dart';
import 'package:gis/Screens/onboarding_Screens/on_boarding.dart';

String? R_ID;
String? titel;
String? description;
String? sec_name;

int itemNUM = 16;

class Home_Sec extends StatefulWidget {
  const Home_Sec({Key? key}) : super(key: key);

  @override
  State<Home_Sec> createState() => _Home_SecState();
}

class _Home_SecState extends State<Home_Sec> {
  final user = FirebaseAuth.instance.currentUser!;
  String selectedType = "SOS"; //1

  Map<String, dynamic> data = {};
  Future getdata() async {
    data.clear();
    await FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: user.email)
        .get()
        .then((value) => value.docs.forEach((element) {
              data.addAll(element.data());

              print("---------------------------------------");
              print(data);
            }));
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }

  Text _getAppBarTitle() {
    switch (selectedType) {
      case "SOS":
        return Text("Reports Of Emergency", style: TextStyle(color: const Color.fromARGB(255, 73, 6, 2), fontWeight: FontWeight.bold));
      case "First Aid":
        return Text("Reports Of First Aid", style: TextStyle(color: const Color.fromARGB(255, 0, 90, 3), fontWeight: FontWeight.bold));
      case "Report A Problem":
        return Text("Reports Of Problems", style: TextStyle(color: const Color.fromARGB(255, 2, 61, 109), fontWeight: FontWeight.bold));
      default:
        return Text("All Reports", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 148, 161),
      appBar: AppBar(
        title: _getAppBarTitle(),
        backgroundColor: Color.fromARGB(255, 133, 148, 161),
      ),
      drawer: FutureBuilder(
          future: getdata(),
          builder: (context, snapshot) {
            return Drawer(
                child: data['Name'] != null
                    ? Container(
                        color: Colors.grey,
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            DrawerHeader(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${data['Name']}',
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Security',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                              ),
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 0.0,
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.home,
                                color: Colors.black,
                              ),
                              title: const Text('Home Page',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              onTap: () => Navigator.pop(context),
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              title: const Text('Profile',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProfileSec(),
                                    ));
                              },
                            ),
                            ListTile(
                              leading: const Icon(Icons.video_camera_back,
                                  color: Colors.black),
                              title: const Text('Live Camera .. SOON',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              onTap: () {},
                            ),
                            ListTile(
                              leading: const Icon(Icons.map_outlined,
                                  color: Colors.black),
                              title: const Text('Map',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MTIMAP(),
                                    ));
                              },
                            ),
                            ListTile(
                              leading:
                                  const Icon(Icons.logout, color: Colors.black),
                              title: const Text('Log Out',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              onTap: () {
                                FirebaseAuth.instance.signOut();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Onboarding(),
                                    ));
                              },
                            ),
                          ],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                            color: Colors.blue, strokeWidth: 8),
                      ));
          }),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedType = "SOS"; //1
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  child: Text(
                                    'SOS',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedType = "First Aid"; //1
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.greenAccent),
                                  child: Text(
                                    'First Aid',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedType = "Report A Problem"; //1
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue),
                                  child: Text(
                                    'Reports of problems',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 120,
                          width: 164, // متغيرش الرقم دا بقا يباشا (مظبوط بالبيكسل)
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/LogoPNG.png'),
                              fit: BoxFit.contain,
                              alignment: Alignment.centerRight,
                            ),
                          ),
                        ),
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

                              // هناااا الشرط الي هنحدد فيه الريبورتات الي هتتعرض
                              final filteredReports = reports
                                  .where((report) => (report['Type'] == selectedType) && (report['State'] != 'Responded'))
                                  .toList();
                                  //.where((report) => report['Type'] == 'SOS' && report['State'] != 'Responded')

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
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Date :${report['Date']}',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(0.0),
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
                                                    : Image.asset(
                                                        'assets/finshed.png'),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Time :${report['Time']}',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                                        builder: (context) => ReportSOS(
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
                                                            time:
                                                                '${report['Time']}',
                                                            Date:
                                                                '${report['Date']}',
                                                            state:
                                                                '${report['State']}',
                                                            Descriotion:
                                                                '${report['Description']}',
                                                            Photo:
                                                                '${report['Type']}',
                                                            lat: report['lat'],
                                                            long: report['long']),
                                                      ),
                                                    );
                                                  } else if (report['Type'] == 'First Aid') {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReportFIRSTAID(
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
                                                        time:
                                                            '${report['Time']}',
                                                        Date:
                                                            '${report['Date']}',
                                                        State:
                                                            '${report['State']}',
                                                        Descriotion:
                                                            '${report['Description']}',
                                                        Photo:
                                                            '${report['Type']}',
                                                        hasChronicDiseases:
                                                            '${report['hasChronicDiseases']}',
                                                        isReportingForSelf:
                                                            '${report['isReportingForSelf']}',
                                                        lat: report['lat'],
                                                        long: report['long'],                                                      
                                                      ),
                                                    ),
                                                    );
                                                  } else if (report['Type'] == 'Report A Problem') {
                                                    Navigator.push(context, MaterialPageRoute(builder: (context) => ReportBROBLEMS(
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
                                                          Date:
                                                              '${report['Date']}',
                                                          time:
                                                              '${report['Time']}',
                                                          State:
                                                              '${report['State']}',
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
                                                    decoration: TextDecoration
                                                        .underline,
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
            ),
          ],
        ),
      ),
    );
  }
}