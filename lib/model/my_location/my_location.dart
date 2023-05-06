import 'package:donut/model/user/user.dart';

class Location { //메인 화면에서 사용
  String town;

  Location({
    required this.town,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    town: json["town"],
  );

  Map<String, dynamic> toJson() => {
    "town": town,
  };
}

class MyLocation {
  String state;
  String city;
  String town;
  DoUser user;
  DateTime createdAt;

  MyLocation({
    required this.state,
    required this.city,
    required this.town,
    required this.user,
    required this.createdAt,
  });

  factory MyLocation.fromJson(Map<String, dynamic> json) => MyLocation(
    state: json["state"],
    city: json["city"],
    town: json["town"],
    user: DoUser.fromJson(json["user"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "city": city,
    "town": town,
    "user": user.toJson(),
    "createdAt": createdAt.toIso8601String(),
  };
}