import 'package:get_it/get_it.dart';
import 'package:spytifo/data/repository/auth/auth_repository_imple.dart';
import 'package:spytifo/data/sources/auth/auth_firebase_service.dart';
import 'package:spytifo/domain/repository/auth/auth.dart';
import 'package:spytifo/domain/usecase/auth/signin.dart';
import 'package:spytifo/domain/usecase/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImple());

  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<SigninUseCase>(SigninUseCase());
}
