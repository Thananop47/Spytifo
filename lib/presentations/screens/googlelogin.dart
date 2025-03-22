import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GoogleLoginPage extends StatelessWidget {
  const GoogleLoginPage({super.key});

  // final credential = GoogleAuthProvider.credential(idToken: idToken)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(onPressed: () {}, child: Text('Login with google')),
    );
  }
}
