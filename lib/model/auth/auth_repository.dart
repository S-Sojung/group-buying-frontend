
//통신을 하기 위한

import 'package:dio/dio.dart';
import 'package:donut/core/constants/http.dart';
import 'package:donut/dto/auth_request.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//이걸 통해서 싱글톤으로 관리하게된다.
final authRepositoryProvider = Provider<AuthRepository>((ref) {

  return AuthRepository();
});

class AuthRepository {

  Future<ResponseDTO> fetchJoin(JoinReqDTO joinReqDTO) async {
    Response response = await dio.post("/join",data: joinReqDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    responseDTO.data = User.fromJson(responseDTO.data);
    return responseDTO;
  }

  Future<ResponseDTO> fetchLogin(LoginReqDTO loginReqDTO) async{
    // 1. 통신 시작
    Response response = await dio.post("/login",data: loginReqDTO.toJson());

    // 2. DTO 파싱
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    responseDTO.data = User.fromJson(responseDTO.data);

    // 3. 토큰 받기
    responseDTO.token = response.headers["authorization"].toString();
    return responseDTO;
  }
}