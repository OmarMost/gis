import 'package:flutter/material.dart';
import 'auth_page.dart';
import 'on_boarding4.dart';

class Onboarding3 extends StatelessWidget {
  final Key? key; // Named 'key' parameter added to the constructor

  const Onboarding3({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              GestureDetector(
                child: const Text(
                  'Skip',
                  style: TextStyle(
                      color: Colors.yellowAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Auth_Page()));
                },
              ),
            ],
          ),
          Expanded(
            //   flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/firstaid.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          const Text(
            "First Aid",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 55),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Faced a problem? don’t hesitate  to report , our campus security team will  check it up for you and reach out to help as soon  as possible   .",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Onboarding4()));
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
