import 'package:News_API/controller/data_controller.dart';
import 'package:News_API/services/dio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:News_API/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home_page.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  DataController dataController = Get.put(DataController());

  @override
  void initState() {
    dataController.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("US News"),
        actions: [
          TextButton(onPressed: (){
           Get.to(()=>HomePage());
          }, child: const Text("Techcrunch")),

          TextButton(onPressed: (){
            Get.to(()=>DataPage());
          }, child: const Text("US News"))
        ],
      ),
      drawer: const DrawerWidget(),
      body: Obx(
            () => dataController.dataList.isEmpty
            ? Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator.adaptive(),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange),
                  onPressed: () {
                    dataController.getData();
                  },
                  child: const Text("Retry"))
            ],
          ),
        )
            : RefreshIndicator(
          onRefresh: () async {

          },
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: dataController.dataList.length,
            itemBuilder: (context, item) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    Uri url =
                    Uri.parse(dataController.dataList[item].url ?? "");

                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  child: Card(
                    elevation: 10,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                  imageUrl: dataController
                                      .dataList[item].urlToImage ?? ""),
                            ),
                            subtitle: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  dataController.dataList[item].title ?? "No Title",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  dataController
                                      .dataList[item].description ?? "No Description",
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
