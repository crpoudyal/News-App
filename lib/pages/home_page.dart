import 'package:dio_example/controller/news_controller.dart';
import 'package:dio_example/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsController newsController = Get.put(NewsController());

  @override
  void initState() {
    newsController.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("News API"),
        ),
        drawer: const DrawerWidget(),
        body: Obx(
          () => ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: newsController.newsList.length,
            itemBuilder: (context, item) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    Uri url = Uri.parse(newsController.newsList[item].url);

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
                        ListTile(
                          title: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image(
                              image: NetworkImage(
                                  newsController.newsList[item].urlToImage),
                            ),
                          ),
                          subtitle: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                newsController.newsList[item].title.toString(),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                newsController.newsList[item].description
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
