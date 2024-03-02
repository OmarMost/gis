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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15.0),
            width: 300, // Set the desired width for the container
            height: 300, // Set the desired height for the container
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Logo1.jpg'),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          SizedBox(
            height: 20,
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
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(15)),
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
                Icons.remove_red_eye,
              ),
              prefixIcon: Icon(
                Icons.lock,
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
          SizedBox(
            height: 40,
            width: 20.0,
          ),
          Center(
            child: SizedBox(
              width: 350, // width of button
              child: ElevatedButton(
                onPressed: () {
                  // Handle 'Call Security' button click
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0))),
                child: Text(
                  'Login ',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ),
                ),
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
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 11.5,
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
