import 'package:flutter/material.dart';
import 'package:spytifo/data/models/auth/reset_password_req.dart';

import 'package:spytifo/domain/usecase/auth/resetpswd.dart';
import 'package:spytifo/presentations/screens/signin.dart';
import 'package:spytifo/presentations/service_locator.dart';

class ForgotPswd extends StatelessWidget {
  ForgotPswd({super.key});

  final TextEditingController _email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Forgot Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
              Text(
                "Enter your email address",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                  labelText: "Enter email address",
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  var result = await sl<ResetpswdUseCase>().call(
                      params: ResetPasswordReq(email: _email.text.toString()));
                  result.fold(
                    (l) {
                      var snackbar = SnackBar(content: Text(l));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    },
                    (r) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SigninPage(),
                        ),
                        (route) => false,
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
