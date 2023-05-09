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
  MyLocationRes myLocation;

  MyLocationResDTO({
    required this.myLocation,
  });

  factory MyLocationResDTO.fromJson(Map<String, dynamic> json) =>
      MyLocationResDTO(
        myLocation: MyLocationRes.fromJson(json["myLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "myLocation": myLocation.toJson(),
      };
}

class MyLocationRes {
  int id;
  MyLocationUser user;
  String state;
  String city;
  String town;
  DateTime createdAt;

  MyLocationRes({
    required this.id,
    required this.user,
    required this.state,
    required this.city,
    required this.town,
    required this.createdAt,
  });

  factory MyLocationRes.fromJson(Map<String, dynamic> json) => MyLocationRes(
        id: json["id"],
        user: MyLocationUser.fromJson(json["user"]),
        state: json["state"],
        city: json["city"],
        town: json["town"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user": user.toJson(),
        "state": state,
        "city": city,
        "town": town,
        "createdAt": createdAt.toIso8601String(),
      };
}

class MyLocationUser {
  int id;
  String username;
  String? nickname;
  String email;
  String? profile;
  MyLocationRate rate;
  int? ratePoint;
  String? role;
  String? provider;
  String? providerId;
  int? statusCode;
  DateTime createdAt;

  MyLocationUser({
    required this.id,
    required this.username,
    this.nickname,
    required this.email,
    this.profile,
    required this.rate,
    this.ratePoint,
    this.role,
    this.provider,
    this.providerId,
    this.statusCode,
    required this.createdAt,
  });

  factory MyLocationUser.fromJson(Map<String, dynamic> json) => MyLocationUser(
        id: json["id"],
        username: json["username"],
        nickname: json["nickname"],
        email: json["email"],
        profile: json["profile"],
        rate: MyLocationRate.fromJson(json["rate"]),
        ratePoint: json["ratePoint"],
        role: json["role"],
        provider: json["provider"],
        providerId: json["providerId"],
        statusCode: json["statusCode"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "nickname": nickname,
        "email": email,
        "profile": profile,
        "rate": rate.toJson(),
        "ratePoint": ratePoint,
        "role": role,
        "provider": provider,
        "providerId": providerId,
        "statusCode": statusCode,
        "createdAt": createdAt.toIso8601String(),
      };
}

class MyLocationRate {
  int id;
  String rateName;
  DateTime createdAt;

  MyLocationRate({
    required this.id,
    required this.rateName,
    required this.createdAt,
  });

  factory MyLocationRate.fromJson(Map<String, dynamic> json) => MyLocationRate(
        id: json["id"],
        rateName: json["rateName"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rateName": rateName,
        "createdAt": createdAt.toIso8601String(),
      };
}
