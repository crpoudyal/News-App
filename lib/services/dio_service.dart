import 'package:dio/dio.dart';
import 'package:dio_example/model/news_model.dart';

class DioService {
  List<NewsModel> newsList = [];

  Future<List<NewsModel>> getMethod() async {
    try {
      var url =
          "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f6330cdff6244a53b8b7e0082020c8e2";
      Dio dio = Dio();
      final response = await dio.get(url);

      print("response --------- ${response.data}");

      if (response.statusCode == 200) {
        response.data["articles"].forEach((e) {
          newsList.add(NewsModel.fromJson(e));
        });
        return newsList;
      } else {
        print("Error");
        throw Exception("Error");
      }
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
