import 'package:dartz/dartz.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/feature/auth/domain/entites/login_entity.dart';
import 'package:team_task/feature/auth/domain/entites/register_entity.dart';

abstract class AuthRepo {
  Future<Either<ServerException, LoginEntity>> login({
    required String email,
    required String password,
  });
  Future<Either<ServerException, SignInEntity>> register({
    required String email,
    required String password,
    required String name,
  });
  Future<Either<ServerException, dynamic>> logout();
}
