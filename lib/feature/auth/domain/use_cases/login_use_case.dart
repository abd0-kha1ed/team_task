import 'package:dartz/dartz.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/core/functions/use_case.dart';
import 'package:team_task/feature/auth/domain/entites/login_entity.dart';
import 'package:team_task/feature/auth/domain/repos/auth_repo.dart';

class LoginUseCase extends UseCase<LoginEntity, LoginParam> {
  final AuthRepo authRepo;

  LoginUseCase(this.authRepo);
  @override
  Future<Either<ServerException, LoginEntity>> call(LoginParam param) async {
    return await authRepo.login(email: param.email, password: param.password);
  }
}

class LoginParam {
  final String email;
  final String password;

  LoginParam({required this.email, required this.password});
}
