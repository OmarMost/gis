
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://th.bing.com/th/id/OIP.dnqjsjLH1kcLTAf1M9NvlQAAAA?rs=1&pid=ImgDetMain'),
            ),
            SizedBox(height: 48.0),
            Text(
              'Username',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Bold text
            ),
            SizedBox(height: 11.5),
            TextFormField(
              enabled: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: 'Username',
                hintText: 'Enter your username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(height: 11.5),
            Text(
              'College ID',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Bold text
            ),
            SizedBox(height: 11.5),
            TextFormField(
              enabled: false,
              decoration: InputDecoration(
                 prefixIcon: Icon(Icons.credit_card),
                
                labelText: 'College ID',
                hintText: 'Enter your college ID',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(height: 11.5),
            Text(
              'Email',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Bold text
            ),
            SizedBox(height: 11.5),
            TextFormField(
              enabled: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(height: 8.0), // Add some space between the TextFormField and the FloatingActionButton
          ],
        ),
      ),





      //دا عشان  لو الطالب عايز يعمل تعديل للمعلومات بتعتو و ممكن نعملو بشكل تاني 
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add functionality to edit profile
        },
        label: Text('Edit Profile'),
        icon: Icon(Icons.edit),
        backgroundColor: Colors.orange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat, // Center the FloatingActionButton horizontally
    );
  }
}
