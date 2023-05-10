import 'package:dio/dio.dart';
import 'package:donut/core/constants/http.dart';
import 'package:donut/dto/board/board_detail.dart';
import 'package:donut/dto/board/board_home_page_response_dto.dart';
import 'package:donut/dto/board/board_search_req.dart';
import 'package:donut/dto/board/board_search_res.dart';
import 'package:donut/dto/board/mypage_board.dart';
import 'package:donut/dto/board/save_board_req.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/board/board.dart';

class BoardRepository {
  static final BoardRepository _instance = BoardRepository._single();

  factory BoardRepository() {
    return _instance;
  }

  BoardRepository._single();


  Future<ResponseDTO> fetchMyPostList(String jwt) async {
    try {
      Response response = await dio.get("/myPages/boards",
          options: Options(headers: {"Authorization": "$jwt"}));

      print("11111${response.data}");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      print("22222");
      responseDTO.data = MyPageBoard.fromJson(responseDTO.data);
      print("33333");

      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }

  Future<ResponseDTO> fetchSearchPostList(String jwt, String word) async {
    try {
      Response response = await dio.get("/boards/search",
          options: Options(headers: {"Authorization": "$jwt"}),
          data: BoardSearchReq(word: word).toJson(),
      );

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      List<dynamic> mapList = responseDTO.data;
      List<BoardSearchRes> boardList = mapList.map((e) => BoardSearchRes.fromJson(e)).toList();
      responseDTO.data = boardList;

      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }

  Future<ResponseDTO> fetchPostList(String jwt) async {
    //여기서 ref 접근 못하게 jwt를 매개변수로 받게끔 해줌
    try {
      Response response = await dio.get("/main",
          options: Options(headers: {"Authorization": "$jwt"}));

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      //그냥 다이나믹 타입을 List 다이나믹 타입으로 바꿔줌.

      responseDTO.data = BoardHomePageResponseDto.fromJson(responseDTO.data);

      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }

  Future<ResponseDTO> fetchPost(int id, String jwt) async {
    try {
      Response response = await dio.get("/boards/${id}",
          options: Options(headers: {"Authorization": "$jwt"}));

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      print("${responseDTO.data}");
      responseDTO.data = BoardDetailDto.fromJson(responseDTO.data);

      print("데이터~!~! ${responseDTO.data}");

      return responseDTO;
    } catch (e) {
      print(e);
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }

  Future<ResponseDTO> fetchDelete(int id, String jwt) async {
    try {
      Response response = await dio.delete("/post/${id}",
          options: Options(headers: {"Authorization": "$jwt"}));

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // responseDTO.data = Post.fromJson(responseDTO.data); //data는 null 이라서 파싱할 필요가 없음
      return responseDTO;
    } catch (e) {
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }

  // Future<ResponseDTO> fetchUpdate(int id,
  //     PostUpdateReqDTO postUpdateReqDTO, String jwt) async {
  //   try {
  //     Response response = await dio.put(
  //       "/post/${id}",
  //       options: Options(headers: {"Authorization": "$jwt"}),
  //       data: postUpdateReqDTO.toJson(),
  //     );
  //
  //     ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
  //     responseDTO.data = Post.fromJson(responseDTO.data);
  //     //하나의 데이터라서 이렇게 받을 수 있지만, 나중에는 다른 받는 DTO 를 만들어야 할 수 도 있다.
  //     return responseDTO;
  //   } catch (e) {
  //     return ResponseDTO(code: -1, msg: "실패 : ${e}");
  //   }
  // }

  Future<ResponseDTO> fetchSave(
      BoardSaveReq boardSaveReq, String jwt) async {
    try {
      Response response = await dio.post(
        "/boards",
        options: Options(headers: {"Authorization": "$jwt"}),
        data: boardSaveReq.toJson(),
      );

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      print("데이터!!!! ${responseDTO.data}");
      responseDTO.data = BoardDetailDto.fromJson(responseDTO.data);

      return responseDTO;
    } catch (e) {
      print(e);
      return ResponseDTO(status: -1, msg: "실패 : ${e}");
    }
  }
}
