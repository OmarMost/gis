import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Blue Rectangles List'),
        ),
        body: ListView.builder(
          itemCount: 10, // عدد العناصر في القائمة
          itemBuilder: (BuildContext context, int index) {
            // يتم بناء كل عنصر في القائمة هنا
            return Container(
              height: 100, // الارتفاع المحدد للمستطيل
              color: Colors.blue, // لون الخلفية
              margin: EdgeInsets.all(10), // هامش لتباعد بين المستطيلات
              child: Center(
                child: Text(
                  'Item $index', // النص المعروض داخل المستطيل
                  style: TextStyle(
                    color: Colors.white, // لون النص
                    fontSize: 20, // حجم النص
                    fontWeight: FontWeight.bold, // سمك النص
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
