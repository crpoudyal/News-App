import 'package:News_API/interceptor/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class DioService {
  Future<dynamic> getMethod() async {
    try {
      var url =
          "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f6330cdff6244a53b8b7e0082020c8e2";
      Dio dio = Dio()
        ..interceptors.addAll([
        // DioInterceptor(),
          DioCacheManager(CacheConfig(baseUrl: url)).interceptor
        ]);

      return await dio.get(url,
          options: buildCacheOptions(const Duration(days: 2)));
    } catch (e) {
      print(e.toString());
    }
  }
}
