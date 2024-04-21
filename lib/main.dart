import 'dart:collection';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/LoginScreens/auth_page.dart';
import 'package:gis/Screens/LoginScreens/privacy.dart';
import 'package:gis/Screens/LoginScreens/privacy.dart';
import 'package:gis/Screens/SecurtyScreens/homesecurty.dart';
import 'package:gis/Screens/SecurtyScreens/robbery.dart';
import 'package:gis/Screens/SecurtyScreens/report.dart';
import 'package:gis/Screens/StudentScreens/choose_bulding.dart';
import 'package:gis/Screens/LoginScreens/signup.dart';

import 'package:gis/Screens/StudentScreens/student_home.dart';
import 'package:gis/Screens/StudentScreens/location_details.dart';
import 'package:gis/Screens/StudentScreens/sos_page.dart';
import 'package:gis/Screens/StudentScreens/report_problem_page.dart';
import 'package:gis/Screens/StudentScreens/first_aid_page.dart';

import 'package:gis/Screens/StudentScreens/student_home.dart'; //My Page [StudentHome]..Elgammal
import 'package:gis/Screens/StudentScreens/location_details.dart';
import 'package:gis/Screens/LoginScreens/sec_login.dart'; // ..Elgammal
import 'package:gis/Screens/StudentScreens/sos_page.dart'; // ..Elgammal
import 'package:gis/Screens/StudentScreens/report_problem_page.dart'; // ..Elgammal
import 'package:gis/Screens/StudentScreens/first_aid_page.dart'; // .. Elgammal
import 'package:gis/Screens/onboarding_Screens/on_boarding.dart';
import 'package:gis/Screens/onboarding_Screens/type_selection.dart';

import 'package:gis/firebase_options.dart';

import 'package:gis/Screens/StudentScreens/profile.dart';
import 'package:gis/Screens/StudentScreens/profile_Help.dart';
import 'package:gis/Screens/LoginScreens/loginScreen.dart';
import 'package:gis/Screens/LoginScreens/sec_login.dart'; //Main

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SecLogin(), //Put Onboarding to normal Start.
      theme: ThemeData(fontFamily: 'DidactGothic-Regular'),
    );
  }
} // Security_robbery