import 'package:flutter/material.dart';
import 'package:gis/Screens/loginScreen.dart';
import 'package:gis/Screens/signup.dart';

class Log_Or_Register_Page extends StatefulWidget {
  const Log_Or_Register_Page({super.key});

  @override
  State<Log_Or_Register_Page> createState() => _Log_Or_Register_PageState();
}

class _Log_Or_Register_PageState extends State<Log_Or_Register_Page> {
  //always showing login page at first
  bool showlogin = true;
  // Toggling between log and register
  void togglepage() {
    setState(() {
      showlogin = !showlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showlogin) {
      return Login_Screen(ontap: togglepage);
    } else {
      return Sign_Up(ontap: togglepage);
    }
  }
}
