import 'package:News_API/model/news_model.dart';
import 'package:News_API/services/dio_service.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  final dioService = DioService();
  RxList<NewsModel> newsList = RxList();

  Future<List<NewsModel>> getNews() async {
    final response = await dioService.getMethod();

    if (response.statusCode == 200) {
      response.data["articles"].forEach((e) {
        newsList.add(NewsModel.fromJson(e));
      });
      return newsList;
    } else {
      print("Error");
      throw Exception("Error");
    }
  }
}
