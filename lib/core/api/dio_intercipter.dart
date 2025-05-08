import 'package:dio/dio.dart';
import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/core/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.token] =
        CacheHelper.getData(key: ApiKey.token) != null
            ? ' ${CacheHelper.getData(key: ApiKey.token)}'
            : null;
    super.onRequest(options, handler);
  }
}
