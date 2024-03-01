import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Back',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17.0,
        ),
      ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Help',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            Text('Emergency  SOS',
            style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            ),
            
            SizedBox(
              height: 15,
            ),

            Text('Our app is SOS button is your dedicated guardian in times of distress . A single tap summons swift assistance while automatically sharning your location wiht first responders . Peace of mind at your fingertips ',
              style: TextStyle(
                fontSize: 5.0,
                color: Colors.black,
              
              ),
            ),

            
            SizedBox(
              height: 15,
            ),

            Text('Report A Problem',
              style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            ),
            
            
            SizedBox(
              height: 15,
            ),


             Text('Faced a problem? don/ ',
              style: TextStyle(
                fontSize: 5.0,
                color: Colors.black,
              
              ),
            ),
            ]
        ),
            
    ),
    );
    }
    }



