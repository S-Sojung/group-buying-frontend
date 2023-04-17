
//최초 앱이 실행될 때 초기화 되어야 함.
// 1. JWT 존재 유무 확인 (I/O)
// 2. JWT로 회원정보 받아봄 (I/O)
// 3. OK -> LoginSuccess() 호출
// 4. FAIL -> LoginPage로 이동.

import 'package:donut/model/user/user.dart';

class SessionUser {
  //실제로 세션에 넣진 않고, 프로바이더에 넣으면 된다.
  User? user;
  String? jwt;
  bool? isLogin;
  //getter setter 를 써야하지만 지금은 그냥 접근하기


  void loginSuccess(User user, String jwt, bool isLogin){
    this.user = user;
    this.jwt = jwt;
    this.isLogin = true;
    //1이 들어와서 성공하면 이렇게 받으면 된다.
  }

  void logoutSuccess(){
    this.user = null;
    this.jwt = null;
    this.isLogin = false;
  }
}