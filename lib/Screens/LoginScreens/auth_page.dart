import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/home.dart';
import 'package:gis/Screens/LoginScreens/log_register.dart';

class Auth_Page extends StatelessWidget {
  const Auth_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //user logged in
        if (snapshot.hasData) {
          return Home();
        }
        //user not logged in
        else {
          return Log_Or_Register_Page();
        }
      },
    ));
  }
}