import 'package:intl/intl.dart';

//추후 수정
class JoinReqDTO {
  final String email;
  final String password;
  final String nickname;


  JoinReqDTO({
    required this.email,
    required this.password,
    required this.nickname
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트
  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "nickname": nickname,
  };

}

class LoginReqDTO {
  final String username;
  final String password;

  LoginReqDTO({
    required this.username,
    required this.password,
  });

  // 통신을 위해서 json 처럼 생긴 문자열 {"id":1} => Dart 오브젝트
  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };

}