


import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://www.bing.com/images/search?view=detailV2&ccid=8pQGc1uv&id=87809B3215634D76C760F51E9889F68B86C1A418&thid=OIP.8pQGc1uvCGFkeniunEv1rwHaHa&mediaurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.f29406735baf0861647a78ae9c4bf5af%3frik%3dGKTBhov2iZge9Q%26riu%3dhttp%253a%252f%252fcdn.onlinewebfonts.com%252fsvg%252fimg_206976.png%26ehk%3dgCH45Zmryw3yqyqG%252fhd8WDQ53zwYfmC8K9OIkNHP%252fNU%253d%26risl%3d%26pid%3dImgRaw%26r%3d0&exph=980&expw=980&q=profile+icon&simid=608046217381486878&FORM=IRPRST&ck=066DBF2ADF20F60A504632FB5803797F&selectedIndex=0&itb=1'),
            ),
            SizedBox(height: 48.0),
            Text(
              'username',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 11.5),
            TextFormField(
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Enter your username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), 
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(height: 11.5),
            Text(
              'college ID',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 11.5),
            Theme(
              data: ThemeData(
                primaryColor: Colors.orange,
                hintColor: Colors.orange,
              ),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  labelText: 'College ID',
                  hintText: 'Enter your college ID',
                   border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), // بيخلي الحفه مستديره
                  
                ),
              ),
            ),
            SizedBox(height: 11.5),
            Text(
              'Email',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 11.5),
            Theme(
              data: ThemeData(
                primaryColor: Colors.orange,
                hintColor: Colors.orange,
              ),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  
                   border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),// بيخلي الحفه مستديره
                  
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
