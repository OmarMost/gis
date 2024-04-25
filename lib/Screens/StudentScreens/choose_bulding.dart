import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/StudentScreens/choose_floore.dart';
import 'package:gis/Screens/StudentScreens/first_aid_page.dart';
import 'package:gis/Screens/StudentScreens/report_problem_page.dart';
import 'package:gis/Screens/StudentScreens/sos_page.dart';

class Building extends StatefulWidget {
  final String type;
  Building({super.key, required this.type}); //LAST EDIT GAMMAL
  
  //const Building({super.key});

  @override
  State<Building> createState() => _BuildingState();
}

class _BuildingState extends State<Building> {

  int RIDSOS = 1;
  // get RID => '1';
  get typeReport => "SOS";
  String Description = "";

  Future addDat() async {
    FirebaseFirestore.instance
        .collection('Reports')
        .add({'Username': dat['Name'], 'PhoneNum': dat['Phone'], 'Type': typeReport, 'RID': RIDSOS, 'BuildingName': "", 'FloorNum': "", 'Description': Description}); //without ( 'Floor Num': "" )

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
        title: Text('Select the building'),
      ),
      body: Column(
        children: [
          // الصف الأول
          // مبني قاعات المحاضرات
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () { //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => floor(type: 'sos',),
                            ));
                      } else if (widget.type == 'problem') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => floor(type: 'problem',),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => floor(type: 'first aid',),
                            ));
                      }
                },
                child: Container(
                  height: 276,
                  width: 410,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/Buld1.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // لصف الثاني

          Row(
            children: [
              SizedBox(
                width: 1,
              ),
              // مبني السكاشن
              GestureDetector(
                onTap: () { //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => floor(type: 'sos',),
                            ));
                      } else if (widget.type == 'problem') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => floor(type: 'problem',),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => floor(type: 'first aid',),
                            ));
                      }
                },
                child: Container(
                  height: 289,
                  width: 98,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/buld3.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              Column(
                children: [
                  // كافتريا 1
                  GestureDetector(
                    onTap: () { //LAST EDIT GAMMAL
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
                      // هنا مفيش ادوار
                    },
                    child: Container(
                      height: 129,
                      width: 64,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld5.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  // كافتريا 2
                  GestureDetector( 
                    onTap: () { //LAST EDIT GAMMAL
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
                      // هنا مفيش ادوار
                    },
                    child: Container(
                      height: 158,
                      width: 64,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld6.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // حرم الجامعه
                  GestureDetector(
                    onTap: () { //LAST EDIT GAMMAL
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
                      // هنا مفيش ادوار
                    },
                    child: Container(
                      height: 295,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld9.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // كافتريا 3
                  GestureDetector(
                    onTap: () { //LAST EDIT GAMMAL
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
                      // هنا مفيش ادوار
                    },
                    child: Container(
                      height: 158,
                      width: 67,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld7.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),

                  //كافتريا 4
                  GestureDetector(
                    onTap: () { //LAST EDIT GAMMAL
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
                      // هنا مفيش ادوار
                    },
                    child: Container(
                      height: 126,
                      width: 67,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld8.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // مبني اللابات
              GestureDetector(
                onTap: () { //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => floor(type: 'sos',),
                            ));
                      } else if (widget.type == 'problem') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => floor(type: 'problem',),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => floor(type: 'first aid',),
                            ));
                      }
                },
                child: Container(
                  height: 287,
                  width: 110,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/buld4.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // الصفف الثالث
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // المبني الاداري
              GestureDetector(
                onTap: () { //LAST EDIT GAMMAL
                      if (widget.type == 'sos') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => floor(type: 'sos',),
                            ));
                      } else if (widget.type == 'problem') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => floor(type: 'problem',),
                            ));
                      }
                      if (widget.type == 'first aid') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => floor(type: 'first aid',),
                            ));
                      }
                },
                child: Container(
                  height: 183,
                  width: 410,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/buld2.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}