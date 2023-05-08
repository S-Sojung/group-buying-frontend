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

  MyLocation({
    required this.state,
    required this.city,
    required this.town
  });

  factory MyLocation.fromJson(Map<String, dynamic> json) => MyLocation(
    state: json["state"],
    city: json["city"],
    town: json["town"]
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "city": city,
    "town": town
  };
}