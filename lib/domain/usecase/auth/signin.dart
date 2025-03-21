import 'package:dartz/dartz.dart';
import 'package:spytifo/core/usecase/usecase.dart';

import 'package:spytifo/data/models/auth/signin_user_req.dart';
import 'package:spytifo/domain/repository/auth/auth.dart';
import 'package:spytifo/presentations/service_locator.dart';

class SigninUseCase implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) {
    return sl<AuthRepository>().signin(params!);
  }
}
