import 'package:dio/dio.dart';
import 'package:team_task/core/api/end_points.dart';
import 'package:team_task/core/cache/cache_helper.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = CacheHelper.getData(key: ApiKey.token);

    if (token != null) {
      // If there are no existing query parameters, initialize them
      options.queryParameters = Map.from(options.queryParameters)
        ..putIfAbsent(ApiKey.token, () => token);
    }

    super.onRequest(options, handler);
  }
}
