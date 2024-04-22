import 'package:flutter/material.dart';
import 'package:gis/Screens/StudentScreens/choose_floore.dart';

class Building extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select the building'),
      ),
      body: Column(
        children: [
          // الصف الأول
          // مبني قاعات المحاضرات
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => floor()));
                },
                child: Container(
                  height: 276,
                  width: 410,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/Buld1.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // لصف الثاني

          Row(
            children: [
              SizedBox(
                width: 1,
              ),
              // مبني السكاشن
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => floor()));
                },
                child: Container(
                  height: 289,
                  width: 98,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/buld3.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 1),
              Column(
                children: [
                  // كافتريا 1
                  GestureDetector(
                    onTap: () {
                      //   Navigator.push(
                      //  context,
                      ////  MaterialPageRoute(
                      // builder: (context) => const floor()));
                      // هنا مفيش ادوار
                    },
                    child: Container(
                      height: 129,
                      width: 64,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld5.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),
                  // كافتريا 2
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //   MaterialPageRoute(
//builder: (context) => const floor()));
                    },
                    child: Container(
                      height: 158,
                      width: 64,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld6.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // حرم الجامعه
                  GestureDetector(
                    onTap: () {
                      //     Navigator.push(
                      //          context,
                      /////       MaterialPageRoute(
                      //         builder: (context) => const floor()));
                    },
                    child: Container(
                      height: 295,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld9.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  // كافتريا 3
                  GestureDetector(
                    onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //    builder: (context) => const floor()));
                    },
                    child: Container(
                      height: 158,
                      width: 67,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld7.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 1),

                  //كافتريا 4
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      ////   MaterialPageRoute(
                      //       builder: (context) => const floor()));
                    },
                    child: Container(
                      height: 126,
                      width: 67,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/buld8.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // مبني اللابات
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => floor()));
                },
                child: Container(
                  height: 287,
                  width: 110,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/buld4.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // الصفف الثالث
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // المبني الاداري
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => floor()));
                },
                child: Container(
                  height: 183,
                  width: 410,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/buld2.jpg'), // تغيير المسار إلى مسار الصورة الخاصة بك
                      fit: BoxFit.cover,
                    ),
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
