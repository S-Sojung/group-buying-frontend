import 'package:donut/dto/my_page/my_account_dto.dart';
import 'package:donut/dto/my_page/my_location_dto.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/my_account/my_account.dart';
import 'package:donut/model/my_account/my_account_repository.dart';
import 'package:donut/model/my_location/my_location_repository.dart';

void main() async {
  await fetchMyAccount_test();
}

Future<void> fetchMyAccount_test() async {
  String jwt = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWQiOjEsImV4cCI6MTY4MzUxODU4M30.erqgT5tUU9syrhSjee0V9MXk04DulcP5rTFNhdk3waO4fusHImgX2EeM2Sa_Vhmrf_wSNEfxMZBZ502-49sgIw";
  ResponseDTO responseDTO =await MyAccountRepository().fetchMyAccount(jwt);
  print(responseDTO.status);
  print(responseDTO.msg);
  MyAccount dto = responseDTO.data;
  print(dto.accountNumber);
}

Future<void> fetchSaveMyAccount_test() async {
  String jwt = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWQiOjEsImV4cCI6MTY4MzUxODU4M30.erqgT5tUU9syrhSjee0V9MXk04DulcP5rTFNhdk3waO4fusHImgX2EeM2Sa_Vhmrf_wSNEfxMZBZ502-49sgIw";
  MyAccountReqDTO myAccountReqDTO = MyAccountReqDTO(brand: "신한", accountNumber: "000000000000");
  ResponseDTO responseDTO =await MyAccountRepository().fetchAccountSave(myAccountReqDTO,jwt);
  print(responseDTO.status);
  print(responseDTO.msg);
  MyAccount dto = responseDTO.data;
  print(dto);
}

Future<void> fetchUpdateMyAccount_test() async {
  String jwt = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWQiOjEsImV4cCI6MTY4MzUxODU4M30.erqgT5tUU9syrhSjee0V9MXk04DulcP5rTFNhdk3waO4fusHImgX2EeM2Sa_Vhmrf_wSNEfxMZBZ502-49sgIw";
  MyAccountReqDTO myAccountReqDTO = MyAccountReqDTO(brand: "우체국", accountNumber: "111111111");
  ResponseDTO responseDTO =await MyAccountRepository().fetchAccountUpdate(myAccountReqDTO,jwt);
  print(responseDTO.status);
  print(responseDTO.msg);
  MyAccount dto = responseDTO.data;
  print(dto);
}