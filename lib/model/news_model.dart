class NewsModel {
  late final String title;
  late final String description;

  NewsModel({
    required this.title,
    required this.description,
  });

  NewsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }
}
