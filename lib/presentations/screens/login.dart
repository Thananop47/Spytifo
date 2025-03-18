import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [
          Image.asset("assets/Images/spytifo.jpg"),
          Text("Unleash yourself with the music you love.")
        ],
      )),
    );
  }
}
