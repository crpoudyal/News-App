class NewsModel {
  late final String title;
  late final String description;
  late final String urlToImage;

  NewsModel({
    required this.title,
    required this.description,
    required this.urlToImage,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
  }
}
