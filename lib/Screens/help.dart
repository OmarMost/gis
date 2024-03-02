import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 8.0),
              child: Text(
                'Help',
                style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Emergency | SOS',
              style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "Our app's SOS button is your dedicated guardian in times of distress. A single tap summons swift assistance while automatically sharing your location with first responders. Peace of mind at your fingertips.",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.0),
            Text(
              'First Aid',
              style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.greenAccent,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "Faced a problem? don’t hesitate  to report , our campus security team will  check it up for you and reach out to help as soon  as possible   ",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24.0),
            Text(
              'Report A  Problem',
              style: TextStyle(
                  fontSize: 35.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              "Our Aid button is your go-to for immediate help. A quick press brings aid to your location in seconds, ensuring your safety and well-being.",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
