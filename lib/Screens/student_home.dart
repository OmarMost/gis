import 'package:flutter/material.dart';

class StudentHome extends StatefulWidget {
  const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),

      drawer: Drawer(
        // Customize the drawer here
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
                      'Elgammal',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Change text color to black
                      ),
                    ),
                    Text(
                      'Student',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black, // Change text color to black
                      ),
                    ),
                    //اسم الطالب دا مؤقتا لغاية ما نشتغل بال Back-End ----------------->
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300], // Change background color to gray
                ),
              ),
              Divider( // Add divider with desired color
                color: Colors.grey[200], // Set slightly lighter gray for divider
                thickness: 0.0, // Adjust thickness as needed
              ),
              ListTile(
                leading: Icon(Icons.home, color: Colors.black,), // Add home icon
                title: Text('Home Page', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                onTap: () => Navigator.pop(context), // Close the drawer on tap
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.black), // Add profile icon
                title: Text('Profile', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                onTap: () {
                  // Handle profile action
                },
              ),
              ListTile(
                leading: Icon(Icons.help, color: Colors.black), // Add help icon
                title: Text('Help', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                onTap: () {
                  // Handle help action
                },
              ),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.black), // Add logout icon
                title: Text('Log Out', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                onTap: () {
                  // Handle logout action
                },
              ),
            ],
          ),
        ) 
      ),

      backgroundColor: Colors.white, //Set body white

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left) side
        children: [ 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55.0), // Adjust the value as needed
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
          // Add other content here
          Padding(
            padding: EdgeInsets.only(left:10.0), 
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

          //First Rectangular Button
          GestureDetector(
            onTap: () {
              //add Here
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
                  const SizedBox(height: 8.0), // Add space between image and text
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
                    // Add your onTap functionality here
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
                        const SizedBox(height: 20.0), // Add space between image and text
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
                    // Add your onTap functionality here
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
                        const SizedBox(height: 20.0), // Add space between image and text
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