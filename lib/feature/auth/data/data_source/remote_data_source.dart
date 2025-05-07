import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:team_task/core/api/dio_consumer.dart';
import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/feature/auth/data/model/login_model.dart';

class RemoteDataSource {
  final DioConsumer api;

  RemoteDataSource({required this.api});
  Future<Either<ServerException, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signIn,
        data: {'email': email, 'password': password},
      );
      final user = LoginModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.refreshToken);
      // CacheHelper.saveData(key: ApiKey.token, value: user.refreshtoken);
      // CacheHelper.saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);

      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerException(errorModel: e.errorModel));
    }
  }

  Future<Either<ServerException, LoginModel>> register({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signUp,
        data: {'email': email, 'password': password, 'name': name},
      );
      final user = LoginModel.fromJson(response);
      // CacheHelper.saveData(key: ApiKey.token, value: user.refreshtoken);
      // CacheHelper.saveData(key: ApiKey.id, value: user.id);

      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerException(errorModel: e.errorModel));
    }
  }

  Future<Either<ServerException, LoginModel>> logout() async {
    try {
      final response = await api.post(EndPoint.signOut);
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerException(errorModel: e.errorModel));
    }
  }
}
