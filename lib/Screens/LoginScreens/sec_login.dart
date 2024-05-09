import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:gis/Screens/LoginScreens/signup.dart';
import 'package:gis/Screens/SecurtyScreens/home_manger.dart';
import 'package:gis/Screens/SecurtyScreens/homesecurtySOS.dart';
import 'package:gis/Screens/StudentScreens/student_home.dart';
import 'package:gis/Screens/LoginScreens/signup.dart';

class SecLogin extends StatefulWidget {
  //final Function()? ontap;

  //const SecLogin({super.key, required this.ontap});
  @override
  State<SecLogin> createState() => _SecLoginState();
}

// await    async
class _SecLoginState extends State<SecLogin> {
  // any variable will be decalared in the state
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isSecurePassword = true;
  //any function will be written in the state
  void login() async {
    if(emailController.toString().contains("@security.com")){
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home_Sec(),
        ));
    } else if(emailController.toString().contains("@manager.com")) { //By Elgammal to manager
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home_Manger(),
        ));
    }
    else{
    print("the email not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: false,
      ),
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
                    image: AssetImage('assets/sec_Logo.jpg'),
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
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                    borderSide: BorderSide(color: Colors.blue),
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
                      backgroundColor: Colors.blueGrey,
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
                children: [],
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
