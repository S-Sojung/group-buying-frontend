import 'package:dio/dio.dart';
import 'package:donut/core/constants/http.dart';
import 'package:donut/dto/my_page/category.dart';
import 'package:donut/dto/my_page/my_location_dto.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/my_location/my_location.dart';


class MyCategoryRepository {
  static final MyCategoryRepository _instance = MyCategoryRepository._single();

  factory MyCategoryRepository() {
    return _instance;
  }

  MyCategoryRepository._single();

  //목적 : 통신 + 파싱
  Future<ResponseDTO> fetchMyCategory(String jwt) async {
    try {
      Response response = await dio.get("/myCategories",
          options: Options(headers: {"Authorization": "$jwt"}));

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      responseDTO.data = MyCategoryList.fromJson(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }


  Future<ResponseDTO> fetchCategoryPost(
      MyLocationUpdateReqDTO myLocationUpdateReqDTO, String jwt) async {
    try {
      Response response = await dio.post(
        "/myCategories",
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
