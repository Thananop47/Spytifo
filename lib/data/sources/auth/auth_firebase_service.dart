import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spytifo/data/models/auth/create_user_req.dart';
import 'package:spytifo/data/models/auth/reset_password_req.dart';
import 'package:spytifo/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserReq signinUserReq);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );
      return Right("Sign in was Successful");
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
      } else if (signinUserReq.email.isEmpty) {
        message = 'Please fill in email field.';
      } else if (signinUserReq.password.isEmpty) {
        message = 'Please fill in password field.';
      }
      return left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return Right("Sign up was Successful");
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else if (createUserReq.username.isEmpty) {
        message = 'Please fill in username field.';
      } else if (createUserReq.email.isEmpty) {
        message = 'Please fill in email field.';
      } else if (createUserReq.password.isEmpty) {
        message = 'Please fill in password field.';
      }
      return left(message);
    }
  }
  // @override
  // Future<Either> resetPassword(ResetPasswordReq resetPasswordReq) async {
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(
  //       email: resetPasswordReq.email,
  //     );
  //     return Right('Password reset email sent.');
  //   } on FirebaseAuthException catch (e) {
  //     String message = '';
  //   }
  // }
}
