import 'package:json_annotation/json_annotation.dart';
part 'data_model.g.dart';


@JsonSerializable()
class DataModel{
  late final String? title;
  late final String? description;
  late final String? urlToImage;
  late final String? url;

  DataModel({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url,
  });
  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}