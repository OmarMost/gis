import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gis/Screens/loginScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  signout() {
    return FirebaseAuth.instance.signOut();
  }

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('You Logged In as ${user.email!}')),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  signout();
                });
              },
              child: Text('Log out'))
        ],
      ),
    );
  }
}
