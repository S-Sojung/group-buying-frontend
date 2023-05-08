import 'package:donut/model/user/user.dart';
import 'package:intl/intl.dart';

class MyLocationUpdateReqDTO {
  final String state;
  final String city;
  final String town;

  MyLocationUpdateReqDTO({
    required this.state,
    required this.city,
    required this.town,
  });

  Map<String, dynamic> toJson() => {
    "state": state,
    "city": city,
    "town": town,
  };
}

class MyLocationResDTO {
  String state;
  String city;
  String town;
  DoUser user;
  DateTime createdAt;

  MyLocationResDTO({
    required this.state,
    required this.city,
    required this.town,
    required this.user,
    required this.createdAt,
  });

  factory MyLocationResDTO.fromJson(Map<String, dynamic> json) => MyLocationResDTO(
    state: json["state"],
    city: json["city"],
    town: json["town"],
    user: DoUser.fromJson(json["user"]),
    createdAt: DateFormat("yyyy-mm-dd").parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "city": city,
    "town": town,
    "user": user.toJson(),
    "createdAt": createdAt,
  };
}
