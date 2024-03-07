import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:gis/Screens/LoginScreens/privacy.dart';
import 'package:gis/Screens/home.dart';
import 'package:gis/Screens/StudentScreens/student_home.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key, required void Function() onPressed});
  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final nameController = TextEditingController();
  final collegeIdController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confpasswordController = TextEditingController();
  final phoneController = TextEditingController();
  bool _isSecurePassword1 = true;
  bool _isSecurePassword2 = true;
  bool status = false;

  Future signup() async {
    if (passwordController.text == confpasswordController.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StudentHome(),
          ));
      addData(nameController.text, collegeIdController.text,
          phoneController.text, emailController.text);
    } else {
      print('Password doesnt match');
    }
  }

  Future addData(String name, id, phone, email) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .add({'Name': name, 'ID': id, 'Phone': phone, 'Email': email});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(15)),
                )),
            const SizedBox(
              height: 30.0,
            ),
            TextFormField(
                keyboardType: TextInputType.phone,
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  prefixIcon: Icon(Icons.phone),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(15)),
                )),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: collegeIdController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'College Id',
                prefixIcon: Icon(Icons.credit_card),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(15)),
                )),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _isSecurePassword1,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_open),
                  suffixIcon: togglePassword(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(15)),
                )),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: confpasswordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _isSecurePassword2,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: togglePassword2(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: SizedBox(
                width: 350, // width of button
                child: ElevatedButton(
                  onPressed: () {
                    signup();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0))),
                          
                  child: Text(
                    'Sign Up',
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
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: status,
                  onChanged: (val){
                    setState(() {
                      status = val!;
                    });
                  },
                ),
                Text(
                  'I have read & agreed to DayTask',
                  style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.blueAccent,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Privacy(onPressed: () {  },)));
                    },
                  child: Text(
                    'Privacy Policy" Terms & Condition',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.orange,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword1 = !_isSecurePassword1;
        });
      },
      icon: _isSecurePassword1
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }

  Widget togglePassword2() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword2 = !_isSecurePassword2;
        });
      },
      icon: _isSecurePassword2
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
}
