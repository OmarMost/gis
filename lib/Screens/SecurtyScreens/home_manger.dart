import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
                //   borderRadius: BorderRadius.circular(5),
                // color: Color.fromARGB(33, 1, 1, 1),
                //),
                //child: Row(
                //children: [
                //Icon(
                // Icons.search,
                //),
                //SizedBox(
                //width: 10,
                //),
                //Text(
                //'search for report ',
                //style: TextStyle(),
                //),
                // ],
                //),
                ),
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
                                                builder: (context) => ReportSOS(
                                                      Descriotion: "l",
                                                      Photo: "l",
                                                      buildingName: '2',
                                                      floorNumber: "4",
                                                      userid: "457785",
                                                      name: 'OZ',
                                                      phoneNumber: "012",
                                                      reportId: "77",
                                                      reporttype: "Rname",
                                                      time: '22:00',
                                                      state: '777',
                                                      lat: '',
                                                      long: '',
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 12,
                        scrollDirection: Axis.horizontal,
                        itemExtent: 200,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    '$sec_name',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        'https://play-lh.googleusercontent.com/EX6jTQW25Tg17OrbeQJk7OjELqK0Un1RaJsYavBQKZFXMnABy2bokpHnSi2gkhVGdY9g=w240-h480-rw'),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 60,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Available or busy:',
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Image(
                                  width: 30,
                                  height: 30,
                                  image: AssetImage('assets/not_finshed.png'),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  'Report ID : ',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
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
