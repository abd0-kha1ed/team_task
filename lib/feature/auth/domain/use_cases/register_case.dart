import 'package:dartz/dartz.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/core/helper_functions/use_case.dart';
import 'package:team_task/feature/auth/domain/entites/register_entity.dart';
import 'package:team_task/feature/auth/domain/repos/auth_repo.dart';

class SignInCase implements UseCase<SignInEntity, SignInParams> {
  final AuthRepo authRepo;

  SignInCase(this.authRepo);

  @override
  Future<Either<ServerException, SignInEntity>> call(
    SignInParams params,
  ) async {
    return await authRepo.register(
      email: params.email,
      password: params.password,
      name: params.name,
    );
  }
}

class SignInParams {
  final String email;
  final String password;
  final String name;

  SignInParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
