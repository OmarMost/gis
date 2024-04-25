import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/StudentScreens/first_aid_page.dart';
import 'package:gis/Screens/StudentScreens/report_problem_page.dart';
import 'package:gis/Screens/StudentScreens/sos_page.dart';

class floor extends StatefulWidget {
  final String type;
  floor({super.key, required this.type}); //LAST EDIT GAMMAL
  //const floor({super.key});

  @override
  State<floor> createState() => _floorState();
}

class _floorState extends State<floor> {

  int RIDSOS = 1;
  // get RID => '1';
  get typeReport => "SOS";
  String Description = "";

  Future addDat() async {
  FirebaseFirestore.instance
      .collection('Reports')
      .add({'Username': dat['Name'], 'PhoneNum': dat['Phone'], 'Type': typeReport, 'RID': RIDSOS, 'BuildingName': "", 'FloorNum': "", 'Description': Description});

      setState(() {
        RIDSOS++;
      });
  }

  final userr = FirebaseAuth.instance.currentUser!;
  Map<String, dynamic> dat = {};
  getdat() {
    dat.clear();
    FirebaseFirestore.instance
        .collection('Users')
        .where('Email', isEqualTo: userr.email)
        .get()
        .then((value) => value.docs.forEach((element) {
              dat.addAll(element.data());

              print("-------------------------------------");
              print(dat);
              print('data usersssssssssssssssss');
            }));
  }

  @override
  void initState() {
    getdat();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Please select a floor:',
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 150,
          ),
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
                    onPressed: () { //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        addDat();//=========================================
                        print('Senttttttttttttt');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SOSPage(),
                            ));
                      } else if (widget.type == 'problem') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportAProblem(),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstAid(),
                            ));
                      }
                    },
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
                    onPressed: () { //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        addDat();//=========================================
                        print('Senttttttttttttt');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SOSPage(),
                            ));
                      } else if (widget.type == 'problem') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportAProblem(),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstAid(),
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      backgroundColor: Colors.white,
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
                    onPressed: () { //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        addDat();//=========================================
                        print('Senttttttttttttt');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SOSPage(),
                            ));
                      } else if (widget.type == 'problem') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportAProblem(),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstAid(),
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1.0),
                      ),
                      minimumSize: Size(300.0, 60.0), // Width and height
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () { //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        addDat();//=========================================
                        print('Senttttttttttttt');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SOSPage(),
                            ));
                      } else if (widget.type == 'problem') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReportAProblem(),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FirstAid(),
                            ));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                      ),
                      minimumSize: Size(300.0, 60.0), // Width and height
                    ),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
