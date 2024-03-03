import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/LoginScreens/loginScreen.dart';
import 'package:gis/Screens/StudentScreens/help.dart';
import 'package:gis/Screens/StudentScreens/location_details.dart';
import 'package:gis/Screens/StudentScreens/profile.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  final user = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic> data = {};
  void getdata() {
    FirebaseFirestore.instance
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
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        drawer: Drawer(
            child: Container(
          color: Colors.grey[300], // Set background color to a lighter gray
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // '${user.email}',
                      '${data['Name']}',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Change text color to black
                      ),
                    ),
                    Text(
                      'Student', //اسم الطالب دا مؤقتا لغاية ما نشتغل بال Back-End ----------------->
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black, // Change text color to black
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Change background color to gray
                ),
              ),
              Divider(
                color:
                    Colors.grey[200], // Set slightly lighter gray for divider
                thickness: 0.0, // Adjust thickness as needed
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                title: Text('Home Page',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                onTap: () => Navigator.pop(context), // Close the drawer on tap
              ),
              ListTile(
                leading:
                    Icon(Icons.person, color: Colors.black), // profile icon
                title: Text('Profile',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                onTap: () {
                  // Handle profile action
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                },
              ),
              ListTile(
                leading: Icon(Icons.help, color: Colors.black), // help icon
                title: Text('Help',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Help(),
                      ));
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.logout, color: Colors.black), // logout icon
                title: Text('Log Out',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                onTap: () {
                  // Handle logout action
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login_Screen(ontap: () {  },),
                      ));
                },
              ),
            ],
          ),
        )),
        backgroundColor: Colors.white, //Set body of Home Screen white

        body: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Align children to the start (left) side
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 55.0), // Adjust the value as needed
              child: Center(
                child: Image.asset(
                  'assets/Logo1.jpg',
                ),
              ),
            ),

            //With Image.network
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 55.0), // Adjust the value as needed
            //   child: Image.network(
            //     'https://lh3.googleusercontent.com/proxy/hg2zLHy6pToDdFdRgOPqokkx7aQPbm8qfB0AiDCabquCtOvU4yq4_mDKlD4YukK4BUxGu8Vl7Yp7S92S-tDINAj6rB0RMwSMWJUg',
            //     width: 300,
            //     height: 300,
            //   ),
            // ),

            const SizedBox(height: 15.0), // Add some space between image and other content
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "What do you want to Report?",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey, // Set text color to gray
                  shadows: [
                    Shadow(
                      color: Colors.black, // Shadow color
                      offset: Offset(2, 2), // Offset of the shadow
                      blurRadius: 4, // Blur radius of the shadow
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 6.0), //Add Space
            //First Rectangular Button [SOS]
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LocationDetailsPage()));
              },
              child: Container(
                width: double.infinity, // 100% width
                color: Colors.red, // Red color

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/sos.png',
                      width: 130,
                      height: 130,
                    ),
                    const SizedBox(
                        height: 8.0), // Add space between image and text
                    Text(
                      "Emergency | SOS",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20.0), //Add Space
                  ],
                ),
              ),
            ),

            // Two Buttons [ Report A Problem & First Aid ]
            Row(
              children: [
                // First Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationDetailsPage()));
                    },
                    child: Container(
                      color: Colors.blue, // Blue color
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20.0), // Add space
                          Image.asset(
                            'assets/problem.png',
                            width: 100, // Adjust the image size as needed
                            height: 100,
                          ),
                          const SizedBox(
                              height: 20.0), // Add space between image and text
                          Text(
                            "Report A Problem",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 11.5), //Add Space
                        ],
                      ),
                    ),
                  ),
                ),

                // Second Button
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationDetailsPage()));
                    },
                    child: Container(
                      color: Colors.green, // Green color
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20.0), // Add space
                          Image.asset(
                            'assets/firstaid.png',
                            width: 100, // Adjust the image size as needed
                            height: 100,
                          ),
                          const SizedBox(
                              height: 20.0), // Add space between image and text
                          Text(
                            "First Aid",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 11.5), //Add Space
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
}
