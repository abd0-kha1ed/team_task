import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:team_task/core/api/dio_consumer.dart';
import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/feature/auth/data/model/login_model.dart';
import 'package:team_task/feature/auth/data/model/register_model.dart';
import 'package:team_task/core/cache/cache_helper.dart';

class RemoteDataSource {
  final DioConsumer api;

  RemoteDataSource({required this.api});

  Future<Either<ServerException, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.login,
        queryParameters: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );

      final user = LoginModel.fromJson(response.data);

      final decodedToken = JwtDecoder.decode(user.refreshToken);

      // Cache the token and user ID
      CacheHelper.saveData(key: ApiKey.token, value: user.refreshToken);
      CacheHelper.saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);

      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerException(errorModel: e.errorModel));
    }
  }

  Future<Either<ServerException, RegisterModel>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await api.post(
        EndPoint.register,
        queryParameters: {
          ApiKey.email: email,
          ApiKey.password: password,
          ApiKey.name: name,
        },
      );

      final user = RegisterModel.fromJson(response.data);

      // Cache token and ID if returned
      // CacheHelper().saveData(key: ApiKey.token, value: user.token);
      // CacheHelper().saveData(key: ApiKey.id, value: user.id);

      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerException(errorModel: e.errorModel));
    }
  }

  Future<Either<ServerException, LoginModel>> logout() async {
    try {
      final response = await api.post(
        EndPoint.logout,
        // token will be automatically injected by interceptor
      );

      return Right(LoginModel.fromJson(response.data));
    } on ServerException catch (e) {
      return Left(ServerException(errorModel: e.errorModel));
    }
  }
}
