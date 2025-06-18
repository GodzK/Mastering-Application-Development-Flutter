import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phakaphol Native App'),
      ),
      // List view สร้างได้เรื่อยๆจนinfiniteถ้าไม่กำหนด item count
        body: ListView.builder(itemCount: 10,itemBuilder: (context,index){
        return Row(
          children: [
            Checkbox(value: false, onChanged: (value){}),
            Column(
              //การจัดเรียงcontentด้านใน เเละจับอยู่ตรงกลาง
              crossAxisAlignment: CrossAxisAlignment.center,
              // คลุมดเเละจัดเรียงด้วย column
              children: [
                Text("title"),
                SizedBox(height: 8),
                Text("Description"),
              ],
            ),
          ],
        );
      })
    );
  }
}
