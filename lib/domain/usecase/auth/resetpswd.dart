import 'package:dartz/dartz.dart';
import 'package:spytifo/core/usecase/usecase.dart';
import 'package:spytifo/data/models/auth/reset_password_req.dart';
import 'package:spytifo/domain/repository/auth/auth.dart';
import 'package:spytifo/presentations/service_locator.dart';

class ResetpswdUseCase implements Usecase<Either, ResetPasswordReq> {
  @override
  Future<Either> call({ResetPasswordReq? params}) {
    return sl<AuthRepository>().resetPswd(params!);
  }
}
