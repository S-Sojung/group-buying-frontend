import 'package:donut/core/constants/http.dart';
import 'package:donut/core/constants/move.dart';
import 'package:donut/dto/auth_request.dart';
import 'package:donut/dto/my_page/user_profile.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/main.dart';
import 'package:donut/model/user/user_repository.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final userControllerProvider = Provider<UserController>((ref) {
  return UserController(ref);
});

class UserController{
  //IoC 컨테이너에 접근 하는 방법은 ref 뿐이다.
  final mContext = navigatorKey.currentContext; //최상위 화면: 현재 위치
  final Ref ref;
  UserController(this.ref);

  Future<void> join(String email, String password, String nickname) async{
    JoinReqDTO joinReqDTO = JoinReqDTO(email: email, password: password, nickname: nickname);
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
    if(responseDTO.status == 200){
      Navigator.pushNamed(mContext!, Move.loginPage);
    }else{
      final snackBar = SnackBar(content: Text("회원 가입 실패"));
      ScaffoldMessenger.of(mContext!).showSnackBar(snackBar);
    }
  }


  Future<void> login(String username, String password) async{

    LoginReqDTO loginReqDTO = LoginReqDTO(username: username, password: password);
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);

    if(responseDTO.status == 200){
      await secureStorage.write(key: "jwt", value: responseDTO.token);
      ref.read (sessionProvider).loginSuccess(responseDTO.data, responseDTO.token!);
      Navigator.popAndPushNamed(mContext!, Move.boardHomePage);

    }else{
      final snackBar = SnackBar(content: Text("로그인 실패 : ${responseDTO.msg}"));
      ScaffoldMessenger.of(mContext!).showSnackBar(snackBar);
    }
  }

  Future<void> logout() async{
    try {
      await ref.read(sessionProvider).logoutSuccess();
      Navigator.pushNamedAndRemoveUntil(mContext!, Move.afterSplashPage, (route) => false);
    }catch(e){
      final snackBar = SnackBar(content: Text("로그아웃 실패"));
      ScaffoldMessenger.of(mContext!).showSnackBar(snackBar);
    }
  }

  Future<void> updateProfile(String password, String profile,String jwt) async{

    UserProfileUpdateReq updateReq = UserProfileUpdateReq(password: password, profile: profile);
    ResponseDTO responseDTO = await UserRepository().fetchUpdate(updateReq,jwt);

    if(responseDTO.status == 200){
      ref.read(sessionProvider).updateSuccess(profile, jwt);
      Navigator.pop(mContext!);
    }else{
      final snackBar = SnackBar(content: Text("로그인 실패 : ${responseDTO.msg}"));
      ScaffoldMessenger.of(mContext!).showSnackBar(snackBar);
    }
  }

}