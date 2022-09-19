import 'package:dio_example/model/news_model.dart';
import 'package:dio_example/services/dio_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DioService dioService = DioService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dio Network call"),
      ),
      body: FutureBuilder<List<NewsModel>>(
          future: dioService.getMethod(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: dioService.newsList.length,
                itemBuilder: (context, item) {
                  return Card(
                    child: ListTile(
                      title: Text(dioService.newsList[item].title.toString()),
                      subtitle: Text(
                          dioService.newsList[item].description.toString()),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("Something went wrong"),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: const Text("Retry"))
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
