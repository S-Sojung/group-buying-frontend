import 'package:dio/dio.dart';
import 'package:donut/core/constants/http.dart';
import 'package:donut/dto/my_page/my_account_dto.dart';
import 'package:donut/dto/my_page/my_location_dto.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/my_account/my_account.dart';
import 'package:donut/model/my_location/my_location.dart';


class MyAccountRepository {
  static final MyAccountRepository _instance = MyAccountRepository._single();

  factory MyAccountRepository() {
    return _instance;
  }

  MyAccountRepository._single();

  //목적 : 통신 + 파싱
  Future<ResponseDTO> fetchMyAccount(String jwt) async {
    try {
      Response response = await dio.get("/accounts",
          options: Options(headers: {"Authorization": "$jwt"}));

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = MyAccount.fromJson(responseDTO.data);

      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }


  Future<ResponseDTO> fetchAccountUpdate(MyAccountReqDTO myAccountReqDTO, String jwt) async {
    try {
      Response response = await dio.put(
        "/accounts",
        options: Options(headers: {"Authorization": "$jwt"}),
        data: myAccountReqDTO.toJson(),
      );

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = MyAccount.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }

  Future<ResponseDTO> fetchAccountSave(
      MyAccountReqDTO myAccountReqDTO, String jwt) async {
    try {
      Response response = await dio.put(
        "/accounts",
        options: Options(headers: {"Authorization": "$jwt"}),
        data: myAccountReqDTO.toJson(),
      );

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = MyAccount.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }
}
