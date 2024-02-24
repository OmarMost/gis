import 'package:flutter/material.dart';
import 'auth_page.dart';
import 'on_boarding3.dart';

class Onboarding2 extends StatelessWidget {
  final Key? key; // Named 'key' parameter added to the constructor

  const Onboarding2({this.key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
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
                  image: AssetImage('assets/sos.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          const Text(
            "SOS",
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
                    "Our app's SOS button is your dedicated guardian in times of distress. A single tap summons swift assistance while automatically sharing your location with first responders. Peace of mind at your fingertips.",
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
                            builder: (context) => const Onboarding3()));
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
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
