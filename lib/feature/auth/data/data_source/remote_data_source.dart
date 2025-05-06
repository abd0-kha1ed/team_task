import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:team_task/core/api/api_consumer.dart';
import 'package:team_task/core/api/dio_consumer.dart';
import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/core/cache/cache_helper.dart';
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
      final decodedToken = JwtDecoder.decode(user.refreshtoken);
      // CacheHelper.saveData(key: ApiKey.token, value: user.refreshtoken);
      // CacheHelper.saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);

      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerException(errorModel: e.errorModel));
    }
  }
}
