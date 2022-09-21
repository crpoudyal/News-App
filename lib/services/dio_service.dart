import 'package:dio/dio.dart';

class DioService {
  Future<dynamic> getMethod() async {
    try {
      var url =
          "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f6330cdff6244a53b8b7e0082020c8e2";
      Dio dio = Dio();
      return await dio.get(url);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
