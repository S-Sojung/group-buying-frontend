import 'package:donut/dto/board/board_home_page_response_dto.dart';
import 'package:donut/dto/board/save_board_req.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/board/board_repository.dart';

void main() async {
  await fetchSavePost_test();
}

Future<void> fetchPostList_test() async {
  String jwt = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWQiOjEsImV4cCI6MTY4MzE3NDcwOX0.Z8XExkBidCHJGs8YuCAQxS-M9U28YWjWq72V8kRNUlKTqw6jZELdJ0JSCMPKGbtfrU_69eM5mN1DDOBODEptEA";
  ResponseDTO responseDTO = await BoardRepository().fetchPostList(jwt);
  print(responseDTO.status);
  print(responseDTO.msg);
  BoardHomePageResponseDto dto = responseDTO.data;

  print(dto.myLocation.town);
  print(dto.boards[0].id);
  print(dto.boards[0].title);
  print(dto.boards[0].city);
  print(dto.boards[0].state);
  print(dto.boards[0].town);
  print(dto.boards[0].paymentType);
  print(dto.boards[0].qty);
  print(dto.boards[0].price);
  print(dto.boards[0].endAt);
  print(dto.boards[0].recommend);
  print(dto.myCategories[0].name);
}

Future<void> fetchPost_test() async {
  String jwt = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWQiOjEsImV4cCI6MTY4MzU0MzgyN30.Pm5XdZ0tHbgAivASVTGlHsIIVjRm3VGiRzSN9JQb6xFjrJQiqxHKM6Hs122_EkUFoEDS_qUL_qL5DFXcqJPPqA";
  ResponseDTO responseDTO = await BoardRepository().fetchPost(1, jwt);
  print(responseDTO.status);
  print(responseDTO.msg);
  print(responseDTO.data);
}

Future<void> fetchSavePost_test() async {
  String jwt = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWQiOjEsImV4cCI6MTY4MzYwNjIxNX0.WVQhZU89GIkJ6COislsBM5a9f_xXZIXyPVhaUHszzQmTxEjDz8RbYv_0s_PV2CwgztgTUEwSOiBNNPfgNv23sA";
  BoardSaveReq boardSaveReq = BoardSaveReq(categoryId: 1,
      title: "제목",
      content: "내용입니다 내용의 길이는 10자를 넘어야합니다아아",
      state: "부산",
      city: "사상구",
      town: "모라동",
      latitude: 32.111,
      longtitude: 111.111,
      qty: 3,
      paymentType: "앱결제",
      endAt: DateTime(2023),
      price: 1000,
      comment: ["gd","편의점"]);
  ResponseDTO responseDTO = await BoardRepository().fetchSave(
      boardSaveReq, jwt);
  print(responseDTO.status);
  print(responseDTO.msg);
  print(responseDTO.data);
}
