import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/auth_page.dart';
import 'package:gis/Screens/home.dart';
import 'package:gis/Screens/signup.dart';
import 'package:gis/Screens/student_home.dart'; //My Page [StudentHome]..Elgammal
import 'package:gis/Screens/location_details.dart'; // ..Elgammal
import 'package:gis/Screens/sos_page.dart'; // ..Elgammal
import 'package:gis/Screens/report_problem_page.dart'; // ..Elgammal
import 'package:gis/Screens/first_aid_page.dart'; // .. Elgammal
import 'package:gis/firebase_options.dart';
import 'package:gis/Screens/loginScreen.dart';
import 'Screens/on_boarding.dart'; //Main

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
      home: Onboarding(), //Put Onboarding to normal Start.
      theme: ThemeData(fontFamily: 'DidactGothic-Regular'),
    );
  }
}
