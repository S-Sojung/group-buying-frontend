
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:donut/core/constants/http.dart';
import 'package:donut/dto/auth_request.dart';
import 'package:donut/dto/my_page/user_profile.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/user/user.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:logger/logger.dart';

class UserRepository {
  //provider를 통해서 싱글톤으로 관리하지 말고 그냥 싱글톤으로 관리/
  static final UserRepository _instance = UserRepository._single();

  factory UserRepository() {
    return _instance;
  }

  UserRepository._single();

  Future<SessionUser> fetchJwtVerify() async {
    SessionUser sessionUser = SessionUser();
    //앱이 제일 처음 켜질 때 얘가 실행 된다.
    String? deviceJwt = await secureStorage.read(key: "jwt");
    if (deviceJwt != null) {
      try {
        //jwtToken 을 요청하면 인증 정보를 보내줌
        Response response = await dio.get("/jwtToken",
            options: Options(headers: {"Authorization": "$deviceJwt"}));
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
        responseDTO.token = deviceJwt;
        // print("상태 변수 ${responseDTO.status}");
        // print("토큰 값 ${responseDTO.data}");
        responseDTO.data = ParseUser.fromJson(responseDTO.data);
        //서버측 데이터 확인

        if (responseDTO.status == 200) {
          sessionUser.loginSuccess(responseDTO.data, responseDTO.token!);
        } else {
          sessionUser.logoutSuccess();
        }
        return sessionUser;
      } catch (e) {
        Logger().d("에러 이유 : " + e.toString());
        sessionUser.logoutSuccess();
        return sessionUser;
        // return ResponseDTO(code: -1, msg: "jwt토큰이 유효하지 않습니다.");
      }
    } else {
      sessionUser.logoutSuccess();
      return sessionUser;
      // return ResponseDTO(code: -1, msg: "jwt토큰이 존재하지 않습니다.");
    }
  }

  Future<ResponseDTO> fetchJoin(JoinReqDTO joinReqDTO) async {
    try {
      Response response = await dio.post("/join", data: joinReqDTO.toJson());
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = ParseUser.fromJson(responseDTO.data);
      print("데이터 확인 : ${responseDTO.data}");
      return responseDTO;
    } catch (e) {
      //만약 서버에서 이걸 안주면 이렇게 임의로 만들어야 함.
      return ResponseDTO(status: -1, msg: "유저네임 중복");
    }
  }

  Future<ResponseDTO> fetchLogin(LoginReqDTO loginReqDTO) async {
    try {
      // 1. 통신 시작
      Response response = await dio.post("/login", data: loginReqDTO.toJson());

      // 2. DTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // print("데이터 : ${responseDTO.status}");
      // print("데이터 : ${responseDTO.msg}");

      // print("데이터 : ${responseDTO.data}");
      responseDTO.data = ParseUser.fromJson(responseDTO.data);
      // print("데이터 : ${responseDTO.data}");

      // 3. 토큰 받기
      final authorization = response.headers["authorization"];
      // Logger().d("토큰 ${authorization}");

      if (authorization != null) {
        responseDTO.token = authorization.first;
      }
      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "유저네임 혹은 비번이 틀렸습니다");
    }
  }

  Future<ResponseDTO> fetchUpdate(
      UserProfileUpdateReq userProfile, String jwt) async {
    try {
      // 1. 통신 시작
      // var formData = FormData.fromMap({
      //   'profile': await MultipartFile.fromFile(userProfile.profile.path),
      //   'password' : "${userProfile.password}"
      // });

      Response response = await dio.put(
        "/users/update",
        options: Options(
          headers: {"Authorization": "$jwt"},
          followRedirects: false,
          validateStatus: (status) => true,
        ),
        data: userProfile.toJson()
      );

      print("데이터 : ${response.data}");
      // 2. DTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      print("데이터 : ${responseDTO.data}");

      responseDTO.data = UserProfileRes.fromJson(responseDTO.data);
      // print("데이터 : ${responseDTO.data}");

      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }
}
