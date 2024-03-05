import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/LoginScreens/auth_page.dart';
import 'package:gis/Screens/SecurtyScreens/homesecurty.dart';
import 'package:gis/Screens/home.dart';
import 'package:gis/Screens/LoginScreens/signup.dart';
import 'package:gis/Screens/StudentScreens/student_home.dart'; //My Page [StudentHome]..Elgammal
import 'package:gis/Screens/StudentScreens/location_details.dart'; // ..Elgammal
import 'package:gis/Screens/StudentScreens/sos_page.dart'; // ..Elgammal
import 'package:gis/Screens/StudentScreens/report_problem_page.dart'; // ..Elgammal
import 'package:gis/Screens/StudentScreens/first_aid_page.dart'; // .. Elgammal
import 'package:gis/firebase_options.dart';
import 'package:gis/Screens/StudentScreens/profile.dart';
import 'package:gis/Screens/StudentScreens/profile_Help.dart';
import 'package:gis/Screens/LoginScreens/loginScreen.dart';
import 'Screens/onboarding_Screens/on_boarding.dart'; //Main

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
      home: Home_Sec(), //Put Onboarding to normal Start.
      theme: ThemeData(fontFamily: 'DidactGothic-Regular'),
    );
  }
}