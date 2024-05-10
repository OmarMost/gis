import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/SecurtyScreens/home_secPROBLEMS.dart';
import 'package:gis/Screens/SecurtyScreens/homesecurtySOS.dart';
import 'package:gis/Screens/SecurtyScreens/map.dart';
import 'package:gis/Screens/SecurtyScreens/profilesec.dart';
import 'package:gis/Screens/SecurtyScreens/reportFIRSTAID.dart';
import 'package:gis/Screens/onboarding_Screens/on_boarding.dart';

String? R_ID;
String? titel;
String? description;
String? sec_name;

class Home_Sec2 extends StatefulWidget {
  const Home_Sec2({Key? key}) : super(key: key);

  @override
  State<Home_Sec2> createState() => _Home_SecState();
}

class _Home_SecState extends State<Home_Sec2> {
  final user = FirebaseAuth.instance.currentUser!;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 148, 161),
      appBar: AppBar(
        title: Text(
          'Reports of First Aid',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home_Sec()));
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home_Sec2()));
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home_Sec3()));
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
                          height: 130,
                          width: 190,
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
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final reports = snapshot.data!.docs;

                              // هناااا الشرط الي هنحدد فيه الريبورتات الي هتتعرض
                              final filteredReports = reports
                                  .where(
                                      (report) => report['Type'] == 'First Aid')
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
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 25,
                                                color: Colors.green,
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
                                                  '                     State :',
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ReportFIRSTAID(
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
                                                        lat:
                                                            '${report['lat'].toString()}',
                                                        long:
                                                            '${report['long'].toString()}',
                                                      ),
                                                    ),
                                                  );
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
