import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gis/Screens/StudentScreens/student_home.dart';

class FirstAidpage extends StatefulWidget {
 late String id;
   FirstAidpage({Key? key,required this.id}) : super(key: key);

  @override
  State<FirstAidpage> createState() => _FirstAidpageState();
}

@override
void initState() {
  // super.initState();
 
}

class _FirstAidpageState extends State<FirstAidpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentHome(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.center, // Center all child widgets
          child: Column(
            children: [
               AlertDialog(title: Text('data'),content: ElevatedButton(onPressed: (){FirebaseFirestore.instance.collection('Reports').doc(widget.id).update({'RID': widget.id});}, child: Text('data')),),
  
              SizedBox(height: 30.0),
              Text(
                'First Aid',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 60.0),
              Text(
                'Help Is On The Way!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(height: 0.0),
              Text(
                'Stay Calm And Focused',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}