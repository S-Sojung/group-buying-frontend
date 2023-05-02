import 'package:donut/core/constants/http.dart';
import 'package:donut/core/constants/move.dart';
import 'package:donut/dto/auth_request.dart';
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

  Future<void> join(String username, String password, String email) async{
    JoinReqDTO joinReqDTO = JoinReqDTO(username: username, password: password, email: email);
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
    if(responseDTO.code == 1){
      Navigator.pushNamed(mContext!, Move.loginPage);
    }else{
      final snackBar = SnackBar(content: Text("회원 가입 실패"));
      ScaffoldMessenger.of(mContext!).showSnackBar(snackBar);
    }
  }


  Future<void> login(String username, String password) async{

    LoginReqDTO loginReqDTO = LoginReqDTO(username: username, password: password);
    ResponseDTO responseDTO = await UserRepository().fetchLogin(loginReqDTO);
    if(responseDTO.code == 1){
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
      Navigator.pushNamedAndRemoveUntil(mContext!, Move.loginPage, (route) => false);
    }catch(e){
      final snackBar = SnackBar(content: Text("로그아웃 실패"));
      ScaffoldMessenger.of(mContext!).showSnackBar(snackBar);
    }
  }
}