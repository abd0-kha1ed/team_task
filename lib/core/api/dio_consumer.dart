import 'package:dio/dio.dart';
import 'package:team_task/core/api/dio_intercipter.dart';
import 'package:team_task/core/api/end_points.dart';
import 'api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio _dio;

  DioConsumer(this._dio) {
    _dio.options.baseUrl = EndPoint.baseUrl;
    _dio.interceptors.add(ApiInterceptor());
    _dio.interceptors.add(
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        request: true,
        error: true,
        responseBody: true,
      ),
    );
    _dio.options.followRedirects = false;
    _dio.options.headers['Accept'] = 'application/json';

  }

  @override
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.get(
      path,
      options: options,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.post(
      path,
      options: options,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.put(
      path,
      options: options,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.delete(
      path,
      options: options,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<Response> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await _dio.patch(
      path,
      options: options,
      queryParameters: queryParameters,
    );
  }
}
