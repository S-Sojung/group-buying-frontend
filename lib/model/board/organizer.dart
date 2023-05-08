
import 'package:donut/model/rate/rate.dart';
import 'package:intl/intl.dart';

class Organizer {
  int id;
  String username;
  String? nickname;
  String email;
  String? profile;
  Rate rate;
  int ratePoint;
  String role;
  String? provider;
  String? providerId;
  int? statusCode;
  DateTime createdAt;

  Organizer({
    required this.id,
    required this.username,
    this.nickname,
    required this.email,
    this.profile,
    required this.rate,
    required this.ratePoint,
    required this.role,
    this.provider,
    this.providerId,
    this.statusCode,
    required this.createdAt,
  });

  factory Organizer.fromJson(Map<String, dynamic> json) => Organizer(
    id: json["id"],
    username: json["username"],
    nickname: json["nickname"],
    email: json["email"],
    profile: json["profile"],
    rate: Rate.fromJson(json["rate"]),
    ratePoint: json["ratePoint"],
    role: json["role"],
    provider: json["provider"],
    providerId: json["providerId"],
    statusCode: json["statusCode"],
    createdAt: DateFormat("yyyy-mm-dd").parse(json["created"]),
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