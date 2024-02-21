import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:gis/Screens/home.dart';

class Sign_Up extends StatefulWidget {
  final Function()? ontap;
  const Sign_Up({super.key, required this.ontap});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  // any variable will be decalared in the state
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confpasswordController = TextEditingController();
  //any function will be written in the state
  void signup() async {
    if (passwordController.text == confpasswordController.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    } else {
      print('Password doesnt match');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
                label: Text("email "),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
          ),
          TextFormField(
            controller: passwordController,
            decoration: InputDecoration(
                label: Text("Password"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
          ),
          TextFormField(
            controller: confpasswordController,
            decoration: InputDecoration(
                label: Text("Confirm Password"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
          ),
          GestureDetector(
            child: Text('Already Have An Account'),
            onDoubleTap: widget.ontap!,
          ),
          ElevatedButton(onPressed: signup, child: Text('SignUp'))
        ],
      ),
    );
  }
}
