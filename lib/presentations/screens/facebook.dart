import 'package:flutter/material.dart';

class Facebook extends StatelessWidget {
  const Facebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "Can not use Facebook login because its require privacy policy url of application ☹️",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          )),
    );
  }
}
