import 'package:dartz/dartz.dart';
import 'package:spytifo/data/models/auth/create_user_req.dart';

import 'package:spytifo/data/models/auth/reset_password_req.dart';
import 'package:spytifo/data/models/auth/signin_user_req.dart';
import 'package:spytifo/data/sources/auth/auth_firebase_service.dart';
import 'package:spytifo/domain/repository/auth/auth.dart';
import 'package:spytifo/presentations/service_locator.dart';

class AuthRepositoryImple extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> resetPswd(ResetPasswordReq resetPasswordReq) async {
    return await sl<AuthFirebaseService>()
        .sendEmailResetPassword(resetPasswordReq);
  }
}
