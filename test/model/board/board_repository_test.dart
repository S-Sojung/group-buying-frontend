import 'package:donut/dto/board_home_page_response_dto.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/board/board_repository.dart';

void main() async {
  await fetchPostList_test();
}

Future<void> fetchPostList_test() async {
  String jwt = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWQiOjEsImV4cCI6MTY4MzE3NDcwOX0.Z8XExkBidCHJGs8YuCAQxS-M9U28YWjWq72V8kRNUlKTqw6jZELdJ0JSCMPKGbtfrU_69eM5mN1DDOBODEptEA";
  ResponseDTO responseDTO =await BoardRepository().fetchPostList(jwt);
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
