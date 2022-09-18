import 'package:dio/dio.dart';

class DioService {
  Future<dynamic> getMethod() async {
    Dio dio = Dio();
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f6330cdff6244a53b8b7e0082020c8e2";
    await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: "GET"))
        .then((response) {
      print(response);

      return response;
    });
  }
}
