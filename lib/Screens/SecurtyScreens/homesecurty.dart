import 'package:flutter/material.dart';
import 'package:gis/Screens/SecurtyScreens/report.dart';

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
      appBar: AppBar(),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[300],
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Mohamed',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'Securty',
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
                leading: const Icon(Icons.person, color: Colors.black),
                title: const Text('Profile',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
                onTap: () {},
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
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('There are $itemNUM Reports : ',
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemNUM,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Report(
                                  reportName: 'اي حوارر ',
                                  reportId: 7777,
                                  name: 'Mo Ozma',
                                  id: '101010',
                                  phoneNumber: '01288910489',
                                  buildingNumber: '2',
                                  floorNumber: '3',
                                  time: '12:30 PM',
                                )));
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Report $index',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
