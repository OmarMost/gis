import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key, required Null Function() onPressed});

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
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "*Privacy Policy*                                                     Effective Date: 1/3/2024This Privacy Policy governs the manner in which SafeCampus collects, uses, maintains, and discloses information collected from users  of the SafeCampus mobile application . This privacy policy applies to the App and all products and services offered by MTI University.         *Information Collection and Use*                               - *Personal Identification Information:*                      We may collect personal identification information from Users in various ways, including, but not limited to, when Users submit an incident report through the App. Users may be asked for their name, email address, phone number, and other relevant information. We will collect personal identification information from Users only if they voluntarily submit such information to us.-                                                 *Non-personal Identification Information:*                                         We may collect non-personal identification information about Users whenever they interact with our App. Non-personal identification information may include the device name, model, operating system, and other technical information.                                                              *How We Use Collected Information*                                        - We may use the information collected for incident reporting purposes, to improve customer service, to personalize user experience, to send periodic emails regarding incident updates, and to respond to inquiries, questions, and/or other requests.                                                    *Protection of Information*                                        - We adopt appropriate data collection, storage, and processing practices and security measures to protect against unauthorized access, alteration, disclosure, or destruction of your personal information and data stored on our App.                                                                           *Sharing Your Personal Information*                                                 - We do not sell, trade, or rent Users' personal identification information to others. We may share generic aggregated demographic information not linked to any personal identification information regarding visitors and users with our business partners, trusted affiliates, and advertisers.                                                                       *Terms & Conditions*                                                                                           By using this App, you signify your acceptance of this Privacy Policy and the Terms & Conditions. If you do not agree to this policy, please do not use our App. Your continued use of the App following the posting of changes to this policy will be deemed your acceptance of those changes.                                              Modern University for technology and information                                                                0227294184                                                                                            This document was last updated on 7/3/2024",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color:Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]

            ),
        ),
       ),
    );
  }
}