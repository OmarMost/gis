import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/auth_page.dart';
import 'package:gis/Screens/home.dart';
import 'package:gis/Screens/signup.dart';
import 'package:gis/firebase_options.dart';
import 'package:gis/Screens/loginScreen.dart';
import 'Screens/on_boarding.dart';
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
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Onboarding());
  }
}
