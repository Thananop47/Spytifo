import 'package:flutter/material.dart';
import 'package:spytifo/data/models/auth/signin_user_req.dart';
import 'package:spytifo/domain/usecase/auth/signin.dart';
import 'package:spytifo/presentations/root/pages/root.dart';
import 'package:spytifo/presentations/screens/forgot_pswd.dart';
import 'package:spytifo/presentations/screens/signup.dart';
import 'package:spytifo/presentations/service_locator.dart';
import 'package:spytifo/presentations/widgets/loginWith.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

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
          Image.asset(
            "assets/images/spytifo_logo.jpg",
            width: 300,
            height: 250,
          ),
          Text(
            "Unleash yourself with the music you love.",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_circle),
                labelText: "Email",
                contentPadding: EdgeInsets.all(20),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              controller: _password,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key_rounded),
                labelText: "password",
                contentPadding: EdgeInsets.all(20),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => ForgotPswd()));
                    },
                    child: Text(
                      "Forgot password",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              var result = await sl<SigninUseCase>().call(
                params: SigninUserReq(
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
                      builder: (BuildContext context) => RootPage(),
                    ),
                    (route) => false,
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
            child: Text(
              "Sign In",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dont have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: Text("sign up!"))
            ],
          ),
          SizedBox(
            height: 20,
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
                  'or login with',
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
                imageLogoPath: 'assets/images/google_logo.png',
              ),
              Loginwith(
                imageLogoPath: 'assets/images/fb_logo.png',
              ),
            ],
          ),
        ],
      )),
    ));
  }
}
