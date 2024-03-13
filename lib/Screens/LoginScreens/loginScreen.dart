import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:gis/Screens/LoginScreens/signup.dart';
import 'package:gis/Screens/StudentScreens/student_home.dart';
import 'package:gis/Screens/LoginScreens/signup.dart';

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
  bool _isSecurePassword = true;
  //any function will be written in the state
  void login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => StudentHome(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Logo1.jpg'),
                    fit: BoxFit.contain,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                onFieldSubmitted: (value) {
                  print(value);
                },
                decoration: InputDecoration(
                  labelText: 'Email address',
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: passwordController,
                onFieldSubmitted: (value) {
                  print(value);
                },
                obscureText: _isSecurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_open),
                  suffixIcon: togglePassword(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                // width: 20.0,
              ),
              Center(
                child: SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle 'Login' button click
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                    ),
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
              SizedBox(height: 15),
              Row(
                children: [
                  Text('Don\'t have an account ?'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_up(onPressed: () {  },)));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
}
