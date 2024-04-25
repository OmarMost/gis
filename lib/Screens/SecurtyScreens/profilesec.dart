import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProfileSec extends StatefulWidget {
  const ProfileSec({super.key});

  @override
  State<ProfileSec> createState() => _ProfileSecState();
}

class _ProfileSecState extends State<ProfileSec> {
  final emailcontoller = TextEditingController();
  final idcontoller = TextEditingController();
  bool edit = false;
  final user = FirebaseAuth.instance.currentUser;
  
  //To hold img
  //File? imageprofile; //Online

  //To handle all the function of the lib(Image picker)
  //final profileimagepicker = ImagePicker(); //Online
  //To store the url of the uploaded image
  //var image_profile_url; //Online

  Map<String, dynamic> data = {};
  Future getdata() async {
    data.clear();
    await FirebaseFirestore.instance
        .collection('Security')
        .where('Email', isEqualTo: user!.email)
        .get()
        .then((value) => value.docs.forEach((element) {
              data.addAll(element.data());

              print("---------------------------------------");
              print(data);
            }));
  }

  String? profiledoc;
  getprofiledoc() {
    FirebaseFirestore.instance
        .collection('Security')
        .where('Email', isEqualTo: user!.email)
        .get() 
        .then((value) => value.docs.forEach((element) {
              profiledoc = element.reference.id;

              print("---------------------------------------");
              print(profiledoc);
            }));
  }

  Future senddata() async {
    await FirebaseFirestore.instance.collection('Security').doc(profiledoc).update(
      {
        'Name': emailcontoller.text,
        'ID': idcontoller.text
      },
    );
    print('--------------------------------------------------------');
    print('sent');
    emailcontoller.clear();
    idcontoller.clear();
  }
  
  @override
  void initState() { //الحالة البدائية
    getprofiledoc();
    super.initState();
  }

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
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: getdata(),
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: GestureDetector(
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/project-campus-8579a.appspot.com/o/sec_Logo2.jpg?alt=media&token=6be4cd07-ffd8-4854-99cb-407239d8c172'),
                        ),
                      ),
                    ),
                    SizedBox(height: 48.0),
                    Text(
                      'Username',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold), // Bold text
                    ),
                    SizedBox(height: 11.5),
                    TextFormField(
                      controller: emailcontoller,
                      enabled: edit,
                      decoration: InputDecoration(
                        hintText: data['Name'],
                        prefixIcon: Icon(Icons.person),
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
                      'Security ID',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold), // Bold text
                    ),
                    SizedBox(height: 11.5),
                    TextFormField(
                      controller: idcontoller,
                      enabled: edit,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.credit_card),
                        hintText: data['ID'],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 11.5),
                    Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold), // Bold text
                    ),
                    SizedBox(height: 11.5),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: data['Email'],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: !edit,
                          child: FloatingActionButton.extended(
                            onPressed: () {
                              setState(() {
                                edit = !edit;
                              });
                              // Add functionality to edit profile
                            },
                            label: Text('Edit Profile'),
                            icon: Icon(Icons.edit),
                            backgroundColor: Colors.orange,
                          ),
                        ),
                        Visibility(
                          visible: edit,
                          child: FloatingActionButton.extended(
                            onPressed: () {
                                senddata();
                               
                              setState(() {
                                edit = !edit;
                              });
                            },
                            label: Text('Send'),
                            icon: Icon(Icons.edit),
                            backgroundColor: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),

                    // Add some space between the TextFormField and the FloatingActionButton
                  ],
                );
              }),
        ),
      ),

      //دا عشان  لو الطالب عايز يعمل تعديل للمعلومات بتعتو و ممكن نعملو بشكل تاني
    );
  }
}