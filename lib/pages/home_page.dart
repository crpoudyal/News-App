import 'package:cached_network_image/cached_network_image.dart';
import 'package:News_API/controller/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'data_page.dart';

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
        title: const Text("Techcrunch"),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(() => const HomePage());
              },
              child: const Text("Techcrunch")),
          TextButton(
              onPressed: () {
                Get.to(() => const DataPage());
              },
              child: const Text("US News"))
        ],
      ),
      body: Obx(
        () => newsController.newsList.isEmpty
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
                          newsController.getNews();
                        },
                        child: const Text("Retry"))
                  ],
                ),
              )
            : RefreshIndicator(
                onRefresh: () async {},
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: newsController.newsList.length,
                  itemBuilder: (context, item) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async {
                          Uri url = Uri.parse(
                              newsController.newsList[item].url ?? "");

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
                                        imageUrl: newsController
                                                .newsList[item].urlToImage ??
                                            ""),
                                  ),
                                  subtitle: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        newsController.newsList[item].title ??
                                            "No Title",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        newsController
                                                .newsList[item].description ??
                                            "No Title",
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
