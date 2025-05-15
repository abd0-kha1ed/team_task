import 'package:dartz/dartz.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/feature/auth/data/data_source/remote_data_source.dart';
import 'package:team_task/feature/auth/domain/entites/login_entity.dart';
import 'package:team_task/feature/auth/domain/entites/register_entity.dart';
import 'package:team_task/feature/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final RemoteDataSource remoteDataSource;

  AuthRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<ServerException, LoginEntity>> login({
    required String email,
    required String password,
  }) async {
    return await remoteDataSource.login(email: email, password: password);
  }

  @override
  Future<Either<ServerException, dynamic>> logout() async {
    return await remoteDataSource.logout();
  }

  @override
  Future<Either<ServerException, RegisterEntity>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    return await remoteDataSource.register(
      email: email,
      password: password,
      name: name,
    );
  }
}
