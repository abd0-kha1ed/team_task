import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:team_task/core/api/dio_consumer.dart';
import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/core/cache/cache_helper.dart';
import 'package:team_task/core/errors/server_exsption.dart';
import 'package:team_task/core/errors/error_model.dart';
import 'package:team_task/feature/auth/data/model/login_model.dart';
import 'package:team_task/feature/auth/data/model/register_model.dart';

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
        queryParameters: {ApiKey.email: email, ApiKey.password: password},
      );

      final user = LoginModel.fromJson(response.data);

      final decodedToken = JwtDecoder.decode(user.accessToken);
      CacheHelper.saveData(key: ApiKey.token, value: user.accessToken);
      CacheHelper.saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);

      return Right(user);
    } on DioException catch (e) {
      return Left(_handleException(e));
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

      // Handle unexpected redirect or HTML
      if (response.statusCode == 302 ||
          response.data is! Map<String, dynamic>) {
        return Left(
          ServerException(
            errorModel: ErrorModel(
              statusCode: 302,
              errorMessage: 'Email already exists or invalid response.',
            ),
          ),
        );
      }

      final user = RegisterModel.fromJson(response.data);
      return Right(user);
    } on DioException catch (e) {
      return Left(_handleException(e));
    }
  }

  Future<Either<ServerException, LoginModel>> logout() async {
    try {
      final response = await api.post(EndPoint.logout);
      final user = LoginModel.fromJson(response.data);
      return Right(user);
    } on DioException catch (e) {
      return Left(_handleException(e));
    }
  }

  ServerException _handleException(DioException e) {
    final response = e.response;
    final data = response?.data;
    final code = response?.statusCode ?? 500;

    String extractValidationMessage(Map<String, dynamic> errors) {
      try {
        final firstKey = errors.keys.first;
        final messages = errors[firstKey];
        if (messages is List && messages.isNotEmpty) {
          return messages.first.toString();
        }
      } catch (_) {}
      return 'Validation error occurred.';
    }

    if (data is Map<String, dynamic>) {
      if (code == 422 && data.containsKey('errors')) {
        final errorMessage = extractValidationMessage(data['errors']);
        return ServerException(
          errorModel: ErrorModel(statusCode: code, errorMessage: errorMessage),
        );
      }

      return ServerException(
        errorModel: ErrorModel(
          statusCode: code,
          errorMessage: data['message'] ?? 'An error occurred.',
        ),
      );
    }

    return ServerException(
      errorModel: ErrorModel(
        statusCode: code,
        errorMessage: 'Unexpected error. Please try again.',
      ),
    );
  }
}
