import 'package:dartz/dartz.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/core/functions/use_case.dart';
import 'package:team_task/feature/auth/domain/entites/register_entity.dart';
import 'package:team_task/feature/auth/domain/repos/auth_repo.dart';

class RegisterUseCase implements UseCase<RegisterEntity, RegisterParam> {
  final AuthRepo authRepo;

  RegisterUseCase(this.authRepo);

  @override
  Future<Either<ServerException, RegisterEntity>> call(
    RegisterParam params,
  ) async {
    return await authRepo.register(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class RegisterParam {
  final String email;
  final String password;
  final String name;

  RegisterParam({
    required this.email,
    required this.password,
    required this.name,
  });
}
