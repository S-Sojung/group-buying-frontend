import 'package:donut/core/constants/http.dart';
import 'package:donut/model/user/donutuser.dart';
import 'package:donut/model/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';


final sessionProvider = Provider<SessionUser>((ref) {
  return SessionUser();
});

class SessionUser {

  ParseUser? user; //추후 수정 user id와 role만 보이는 것으로
  String? jwt;
  bool? isLogin;
  //getter setter 를 써야하지만 지금은 그냥 접근하기

  void loginSuccess(ParseUser user, String jwt){
    this.user = user;
    this.jwt = jwt;
    this.isLogin = true;
  }

  Future<void> logoutSuccess() async {
    this.user = null;
    this.jwt = null;
    this.isLogin = false;
    await secureStorage.delete(key: "jwt");

    Logger().d("세션 종료 및 디바이스 JWT 삭제");
  }

  Future<void> updateSuccess(String profile, String jwt) async{

    this.user!.user.profile = profile;
    this.jwt = jwt;
    this.isLogin = true;
  }
}