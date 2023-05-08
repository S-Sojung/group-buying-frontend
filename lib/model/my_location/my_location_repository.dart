import 'package:dio/dio.dart';
import 'package:donut/core/constants/http.dart';
import 'package:donut/dto/my_page/my_location_dto.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/my_location/my_location.dart';


class MyLocationRepository {
  static final MyLocationRepository _instance = MyLocationRepository._single();

  factory MyLocationRepository() {
    return _instance;
  }

  MyLocationRepository._single();

  //목적 : 통신 + 파싱
  Future<ResponseDTO> fetchMyLocation(String jwt) async {
    try {
      Response response = await dio.post("/myLocations/default",
          options: Options(headers: {"Authorization": "$jwt"}));

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      responseDTO.data = MyLocationResDTO.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }


  Future<ResponseDTO> fetchLocationUpdate(
      MyLocationUpdateReqDTO myLocationUpdateReqDTO, String jwt) async {
    try {
      Response response = await dio.put(
        "/myLocations",
        options: Options(headers: {"Authorization": "$jwt"}),
        data: myLocationUpdateReqDTO.toJson(),
      );

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = MyLocation.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }
}
