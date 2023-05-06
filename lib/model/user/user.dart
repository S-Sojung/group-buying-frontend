import 'package:donut/model/rate/rate.dart';
import 'package:intl/intl.dart';

class ParseUser{
  DoUser user;

  ParseUser({
    required this.user,
  });

  factory ParseUser.fromJson(Map<String, dynamic> json) => ParseUser(
      user: DoUser.fromJson(json["user"])
  );

  Map<String, dynamic> toJson() => {
    "user": user
  };
}

class DoUser {
  int id;
  String username;
  dynamic nickname;
  String email;
  String? name; //추후 삭제
  dynamic profile;
  Rate rate;
  int? ratePoint; //
  String? role; //
  String? provider;
  String? providerId;
  int? statusCode; // default 로 들어와야한다.
  DateTime createdAt;

  DoUser({
    required this.id,
    required this.username,
    this.nickname,
    required this.email,
    this.name, //추후 삭제
    this.profile,
    required this.rate,
    this.ratePoint,
    this.role,
    this.provider,
    this.providerId,
    this.statusCode,
    required this.createdAt,
  });

  factory DoUser.fromJson(Map<String, dynamic> json) => DoUser(
    id: json["id"],
    username: json["username"],
    nickname: json["nickname"],
    email: json["email"],
    name: json["name"], //추후 삭제
    profile: json["profile"],
    rate: Rate.fromJson(json["rate"]),
    ratePoint: json["ratePoint"],
    role: json["role"],
    provider: json["provider"],
    providerId: json["providerId"],
    statusCode: json["statusCode"],
    createdAt: DateFormat("yyyy-mm-dd").parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "nickname": nickname,
    "email": email,
    "name": name, //추후 삭제
    "profile": profile,
    "rate": rate.toJson(),
    "ratePoint": ratePoint,
    "role": role,
    "provider": provider,
    "providerId": providerId,
    "statusCode": statusCode,
    "createdAt": createdAt,
  };
}
