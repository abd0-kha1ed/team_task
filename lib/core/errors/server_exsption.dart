import 'package:dio/dio.dart';
import 'package:team_task/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handleDioExeption(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.unknown:
      ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
        case 401:
          ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

        case 403:
          ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

        case 404:
          ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

        case 409:
          ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

        case 422:
          ServerException(errorModel: ErrorModel.fromJson(e.response!.data));

        case 504:
          ServerException(errorModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}
