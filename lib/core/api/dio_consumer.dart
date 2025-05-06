import 'package:dio/dio.dart';
import 'package:team_task/core/api/api_consumer.dart';
import 'package:team_task/core/api/dio_intercipter.dart';
import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/core/errors/server_exsption.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        request: true,
        error: true,
        responseBody: true,
      ),
    );
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? quaryparamter,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: quaryparamter,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? quaryparamter,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: quaryparamter,
      );

      return response.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? quaryparamter,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: quaryparamter,
      );

      return response.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? quaryparamter,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: quaryparamter,
      );

      return response.data;
    } on DioException catch (e) {
      handleDioExeption(e);
    }
  }
}
