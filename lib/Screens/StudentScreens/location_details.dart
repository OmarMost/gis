import 'package:flutter/material.dart';
import 'package:gis/Screens/StudentScreens/first_aid_page.dart';
import 'package:gis/Screens/StudentScreens/report_problem_page.dart';
import 'package:gis/Screens/StudentScreens/sos_page.dart';


class LocationDetailsPage extends StatefulWidget {
  final String type;
  LocationDetailsPage({super.key, required this.type});

  @override
  _LocationDetailsPageState createState() => _LocationDetailsPageState();
}

class _LocationDetailsPageState extends State<LocationDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.0), // Add Margin above >>
            Text(
              'Please enter your location details:',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 24.0,
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.0),
            Text(
              'Building',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Button 1
                MaterialButton(
                  onPressed: () {},
                  child: Container(
                    child: Image.network(
                        height: 50,
                        'https://buffer.com/library/content/images/size/w1200/2023/10/free-images.jpg'),
                  ),
                ),
                SizedBox(width: 16.0),
                // Button 2
                ElevatedButton(
                  onPressed: () {
                   
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    backgroundColor: Colors.grey,
                    minimumSize: Size(137, 74), //Width and height
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Button 3
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    backgroundColor: Colors.grey,
                    minimumSize: Size(137, 74), //Width and height
                  ),
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 40.0,
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                // Button 4
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    backgroundColor: Colors.grey,
                    minimumSize: Size(137, 74), //Width and height
                  ),
                  child: Text(
                    '4',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Text(
              'Floor',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.black,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Center(
              child: Container(
                width: 300.0, // width of the frame
                padding: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15)),
                        ),
                        minimumSize: Size(300.0, 60.0), // Width and height
                      ),
                      child: Text(
                        '3',
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.0),
                        ),
                        minimumSize: Size(300.0, 60.0), // Width and height
                      ),
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.orange,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                        ),
                        minimumSize: Size(300.0, 60.0), // Width and height
                      ),
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Center(
              child: SizedBox(
                // width of button
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle 'Next' button click
                      

                      // if (widget.type == 'sos') {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => SOSPage(),
                      //       ));
                      // } else if (widget.type == 'problem') {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => ReportAProblem(),
                      //       ));
                      // }
                      // if (widget.type == 'first aid') {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => FirstAid(),
                      //       ));
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0))),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
//====================================================Delete later==========================================
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // Adjust the alignment as per your preference
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FirstAid(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  child: Text(
                    'Test1',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReportAProblem(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  child: Text(
                    'Test2',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SOSPage(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  child: Text(
                    'Test3',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ],
            )
//====================================================Delete later==========================================
          ],
        ),
      ),
    );
  }
}
