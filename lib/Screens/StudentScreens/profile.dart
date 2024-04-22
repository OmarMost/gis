import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//Elgammal

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
// import 'package:about.dart';
//____________________________________________________

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final emailcontoller = TextEditingController();
  final idcontoller = TextEditingController();
  final phonecontoller = TextEditingController();
  bool edit = false;
  final user = FirebaseAuth.instance.currentUser;
  //Elgammal
  //To hold img
  File? imageprofile; //Online
  //To handle all the function of the lib(Image picker)
  final profileimagepicker = ImagePicker(); //Online
  //To store the url of the uploaded image
  var image_profile_url; //Online
  //____________________________________________________

  Map<String, dynamic> data = {};
  Future getdata() async {
    data.clear();
    await FirebaseFirestore.instance
        .collection('Users')
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
        .collection('Users')
        .where('Email', isEqualTo: user!.email)
        .get() 
        .then((value) => value.docs.forEach((element) {
              profiledoc = element.reference.id;

              print("---------------------------------------");
              print(profiledoc);
            }));
  }

  Future senddata() async {
    await FirebaseFirestore.instance.collection('Users').doc(profiledoc).update(
      {
        'Name': emailcontoller.text,
        'Phone': phonecontoller.text,
        'ID': idcontoller.text
      },
    );
    print('--------------------------------------------------------');
    print('sent');
    emailcontoller.clear();
    phonecontoller.clear();
    idcontoller.clear();
  }

  //Elgammal---------------------------------------------------------------------------------------
  Future uploadProfileImage() async {
   getprofiledoc();
  
    //To open the camera
    var pickedimage = await profileimagepicker.pickImage(source: ImageSource.camera);

    if (pickedimage != null) {
      setState(() {

      imageprofile = File(pickedimage.path);
      
      });
      
      var imagesprofilename = basename(pickedimage.path);
      
      var profileimagerefstorage = FirebaseStorage.instance.ref().child(imagesprofilename);

      var uploadTask = profileimagerefstorage.putFile(imageprofile!);
      await uploadTask.whenComplete(() async {
     
          image_profile_url = await profileimagerefstorage.getDownloadURL();
          print(image_profile_url);
        
       await  FirebaseFirestore.instance.collection('Users').doc(profiledoc).update({'Profile_Image': image_profile_url});
      });
      
      
    } else {}
  }
  // Future uploadProfileImage() async {
  //   // getprofile();
  //   //To open the camera
  //   var pickedimage = await profileimagepicker.pickImage(source: ImageSource.camera);

  //   if (pickedimage != null) {
  //     //Image path
  //     imageprofile = File(pickedimage.path);
  //     //To remove unnesscary paths
  //     var imagesprofilename = basename(pickedimage.path);
  //     //To upload the img to fire storage (ref)
  //     var profileimagerefstorage = FirebaseStorage.instance.ref(imagesprofilename);
  //     //To wait when uploading the img to get the url for the img
  //     await profileimagerefstorage.putFile(imageprofile!);
  //     image_profile_url = await profileimagerefstorage.getDownloadURL();
  //     CollectionReference currentprofile = FirebaseFirestore.instance.collection('Users');
  //     currentprofile.doc(profiledoc).update({'Profile Image': image_profile_url});
  //   } else {}
  // }
  //---------------------------------------------------------------------------------------------

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
                      child: GestureDetector(onDoubleTap: uploadProfileImage,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: data['Profile_Image'] != null //Gammal !!
                          ? NetworkImage(data['Profile_Image']) //Gammal !!
                            : NetworkImage(
                                'https://firebasestorage.googleapis.com/v0/b/project-campus-8579a.appspot.com/o/DefaultImageProfile.jpg?alt=media&token=e1b04a1d-0c2f-4730-b433-5936e02ef1b4'),
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
                      'College ID',
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
                    Text(
                      'Phone',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold), // Bold text
                    ),
                    SizedBox(height: 11.5),
                    TextFormField(
                      controller: phonecontoller,
                      enabled: edit,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: data['Phone'],
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
