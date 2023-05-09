import 'package:dio/dio.dart';
import 'package:donut/core/constants/http.dart';
import 'package:donut/dto/board/board_detail.dart';
import 'package:donut/dto/board/board_home_page_response_dto.dart';
import 'package:donut/dto/board/mypage_board.dart';
import 'package:donut/dto/board/save_board_req.dart';
import 'package:donut/dto/my_page/my_wishlist.dart';
import 'package:donut/dto/my_page/my_wishlist_req.dart';
import 'package:donut/dto/response_dto.dart';

class MyWishRepository {
  static final MyWishRepository _instance = MyWishRepository._single();

  factory MyWishRepository() {
    return _instance;
  }

  MyWishRepository._single();


  Future<ResponseDTO> fetchMyWishList(String jwt) async {
    try {
      Response response = await dio.get("/wishlist",
          options: Options(headers: {"Authorization": "$jwt"}));

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = MyWishBoardList.fromJson(responseDTO.data);

      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }


  Future<ResponseDTO> fetchDelete(WishDeleteReq id, String jwt) async {
    try {
      Response response = await dio.delete("/wishlist",
          options: Options(headers: {"Authorization": "$jwt"}));

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // responseDTO.data = Post.fromJson(responseDTO.data); //data는 null 이라서 파싱할 필요가 없음
      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }

  Future<ResponseDTO> fetchSave(WishSaveReq id, String jwt) async {
    try {
      Response response = await dio.post(
        "/wishlist",
        options: Options(headers: {"Authorization": "$jwt"}),
        data: id.toJson(),
      );

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.data = WishlistListData.fromJson(responseDTO.data);

      return responseDTO;
    } catch (e) {
      print(e);
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }
}
