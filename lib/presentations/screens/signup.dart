import 'package:flutter/material.dart';
import 'package:spytifo/data/models/auth/create_user_req.dart';
import 'package:spytifo/data/sources/auth/auth_firebase_service.dart';
import 'package:spytifo/domain/usecase/auth/signup.dart';

import 'package:spytifo/presentations/screens/signin.dart';
import 'package:spytifo/presentations/service_locator.dart';
import 'package:spytifo/presentations/widgets/loginWith.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController _username = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 50,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 150,
                    child: Text(
                      "Let's get Started",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: _usernameField(context)),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: _emailField(context),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: _passwordField(context)),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
                onPressed: () async {
                  var result = await sl<SignupUseCase>().call(
                    params: CreateUserReq(
                      username: _username.text.toString(),
                      email: _email.text.toString(),
                      password: _password.text.toString(),
                    ),
                  );
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
                  "SIGN UP",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or signup with',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  Loginwith(
                    onPressed: () async {
                      await AuthFirebaseServiceImpl().signinWithGoogle();
                    },
                    imageLogoPath: 'assets/images/google_logo.png',
                  ),
                  // Loginwith(
                  //   imageLogoPath: 'assets/images/fb_logo.png',
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField(BuildContext context) {
    return TextField(
      controller: _username,
      decoration: InputDecoration(
        labelText: "Username",
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: InputDecoration(
        labelText: "Email",
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      obscureText: true,
      decoration: InputDecoration(
        labelText: "password",
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}
