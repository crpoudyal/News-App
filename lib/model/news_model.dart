class NewsModel {
  late final String title;
  late final String description;
  late final String urlToImage;
  late final String url;

  NewsModel({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
    url = json['url'];
  }
}
