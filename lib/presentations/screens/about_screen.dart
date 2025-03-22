import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1E1E1E),
        elevation: 0, // ลบเงาใต้ AppBar
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome to SPYTIFO, your go-to destination for enjoying music anytime, anywhere. With a vast library of songs and an intuitive interface, we strive to provide you with the best music listening experience.',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            SizedBox(height: 16.0),
            Text(
              'Version: 0.00.1',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
            SizedBox(height: 16.0),
            Text(
              'Developer: Thattiya Noojaikhong, Thananop Duangmee, Nithikorn Polngor, Jinnawat Sripawong',
              style: TextStyle(fontSize: 16.0, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
