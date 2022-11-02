import 'package:News_API/model/data_model.dart';
import 'package:News_API/services/data_service.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  final dataService = DataService();
  RxList<DataModel> dataList = RxList();

  Future<RxList<DataModel>> getData() async {
    final response = await dataService.getMethod();

    if (response.statusCode == 200) {
      response.data["articles"].forEach((e) {
        dataList.add(DataModel.fromJson(e));
      });
      return dataList;
    } else {
      print("Error");
      throw Exception("Error");
    }
  }
}
