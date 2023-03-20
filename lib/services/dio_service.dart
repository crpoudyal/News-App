import 'package:News_API/interceptor/dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class DioService {
  Future getMethod() async {
    try {
      var url1 =
          "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f6330cdff6244a53b8b7e0082020c8e2";
      var baseUrl = "https://newsapi.org/";
      Dio dio = Dio()
        ..interceptors.addAll([
          DioInterceptor(),
          DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor,
        ]);

      return await dio.get(url1,options: buildCacheOptions(const Duration(days: 7),maxStale:const Duration(days: 10)));
    } catch (e) {
      print(e.toString());
    }
  }
}
