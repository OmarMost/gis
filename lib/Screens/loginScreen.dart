import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:gis/Screens/home.dart';

class Login_Screen extends StatefulWidget {
  final Function()? ontap;

  const Login_Screen({super.key, required this.ontap});
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  // any variable will be decalared in the state
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //any function will be written in the state
  void login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                decoration: TextDecoration.underline,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: emailController,
              onFieldSubmitted: (value) {
                print(value);
              },
              decoration: InputDecoration(
                labelText: 'email address',
                prefixIcon: Icon(
                  Icons.email,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              onFieldSubmitted: (value) {
                print(value);
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password',
                suffix: Icon(
                  Icons.lock,
                ),
                prefixIcon: Icon(
                  Icons.password,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: MaterialButton(
                onPressed: login,
                child: Text(
                  'login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text('Don\'t have account'),
                TextButton(
                  onPressed: widget.ontap!,
                  child: Text('Register now'),
                ),
              ],
            ),
          ],
        ),
        
      ),
      
    );
  }
}
