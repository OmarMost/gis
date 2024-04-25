import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/SecurtyScreens/profilesec.dart';
import 'package:gis/Screens/SecurtyScreens/report.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 148, 161),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 133, 148, 161),
      ),
      drawer: Drawer(
        child: //data['Name'] != null? 
        Container(
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
                      'My Drawer',
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
                        fontWeight: FontWeight.bold, color: Colors.black)),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                title: const Text('Profile',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileSec(),
                          ));
                    },
              ),
              ListTile(
                leading:
                    const Icon(Icons.video_camera_back, color: Colors.black),
                title: const Text('Live Cameras',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.map_outlined, color: Colors.black),
                title: const Text('Map',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title: const Text('Log Out',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
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
      // : Center(
      //       child: CircularProgressIndicator(
      //           color: Colors.blue, strokeWidth: 8),
      //     )
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 12,
                        scrollDirection: Axis.vertical,
                        itemExtent: 235,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            decoration: BoxDecoration(
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
                                        '                                          Report ID : $R_ID',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '$titel',
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ////
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '$description',
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
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'State',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Image(
                                      width: 50,
                                      height: 50,
                                      image: AssetImage('assets/finshed.png'),
                                    )
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
                                                builder: (context) => Report(
                                                      buildingNumber: '2',
                                                      floorNumber: "4",
                                                      id: "457785",
                                                      name: 'OZ',
                                                      phoneNumber: "012",
                                                      reportId: 8,
                                                      reportName: "Rname",
                                                      time: '22:00',
                                                    )));
                                      },
                                      child: Text(
                                        'See More Details',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
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
