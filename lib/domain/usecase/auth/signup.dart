import 'package:dartz/dartz.dart';
import 'package:spytifo/core/usecase/usecase.dart';
import 'package:spytifo/data/models/auth/create_user_req.dart';
import 'package:spytifo/domain/repository/auth/auth.dart';
import 'package:spytifo/presentations/service_locator.dart';

class SignupUseCase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
