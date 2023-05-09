import 'package:intl/intl.dart';

class Category {
  String name;

  Category({
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class CategoryData {
  int id;
  String name;
  DateTime createdAt;

  CategoryData({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "createdAt": createdAt,
  };
}