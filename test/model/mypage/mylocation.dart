import 'package:donut/dto/board/board_home_page_response_dto.dart';
import 'package:donut/dto/my_page/my_location_dto.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/board/board_repository.dart';
import 'package:donut/model/my_location/my_location_repository.dart';

void main() async {
  await fetchMyLocation_test();
}

Future<void> fetchMyLocation_test() async {
  String jwt = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWQiOjEsImV4cCI6MTY4MzUxMjI5Mn0.CixN7IPfcCEalUr6CyqB0L2jUm9B4a4TInJaqsNlmcuc50QI3jAX-uSF03_jyxA193vVsCzh4Xip-CMmHkmohw";
  ResponseDTO responseDTO =await MyLocationRepository().fetchMyLocation(jwt);
  print(responseDTO.status);
  print(responseDTO.msg);
  MyLocationResDTO dto = responseDTO.data;
  print(dto.myLocation.state);
}

