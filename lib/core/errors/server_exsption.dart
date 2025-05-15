import 'package:dio/dio.dart';
import 'package:team_task/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
  @override
  String toString() => errorModel.errorMessage;
}

void handleDioException(DioException e) {
  final responseData = e.response?.data;

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.connectionError:
      throw ServerException(
        errorModel: ErrorModel(
          statusCode: 408,
          errorMessage: "Connection timeout. Please try again.",
        ),
      );

    case DioExceptionType.unknown:
      throw ServerException(
        errorModel: ErrorModel(
          statusCode: 520,
          errorMessage: "Something went wrong. Please try again.",
        ),
      );

    case DioExceptionType.badResponse:
      final code = e.response?.statusCode ?? 500;

      throw ServerException(
        errorModel:
            responseData is Map<String, dynamic>
                ? ErrorModel.fromJson(responseData)
                : ErrorModel(
                  statusCode: code,
                  errorMessage: 'Unexpected error with status code $code',
                ),
      );
  }
}
