import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

class DataService{
  Future getMethod() async {
    try {
      var url2 =
          "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f6330cdff6244a53b8b7e0082020c8e2";
      var baseUrl = "https://newsapi.org/";
      Dio dio = Dio()
        ..interceptors.addAll([
          DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor,
        ]);
      return await dio.get(url2,options: buildCacheOptions(const Duration(days: 7)));
    } catch (e) {
      print(e.toString());
    }
  }
}