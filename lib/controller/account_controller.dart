import 'package:donut/dto/my_page/my_account_dto.dart';
import 'package:donut/dto/my_page/my_location_dto.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/main.dart';
import 'package:donut/model/my_account/my_account_repository.dart';
import 'package:donut/model/my_location/my_location_repository.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/pages/board/home_page/board_home_page_view_model.dart';
import 'package:donut/views/pages/user/account_page/user_account_page_view_model.dart';
import 'package:donut/views/pages/user/hometown_page/user_hometown_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final accountControllerProvider = Provider<AccountController>((ref) {
  return AccountController(ref);
});

class AccountController{
  // Repository, ViewModel 의존
  final mContext = navigatorKey.currentContext; //최상위 화면: 현재 위치
  final Ref ref;
  AccountController(this.ref);

  // Future<void> deletePost(int id) async{
  //   SessionUser sessionUser = ref.read(sessionProvider);
  //   await BoardRepository().fetchDelete(id, sessionUser.jwt!);
  //   ref.read(boardHomePageProvider.notifier).notifyRemove(id);
  //   Navigator.pop(mContext!);
  //
  //   // if(responseDTO.code == 1){
  //   //   //DetailViewModel 은 파괴
  //   //   //List를 갱신 , init 하던가 delete 하던가.
  //   //   Navigator.pop(mContext!);
  //   // }else{
  //   //   final snackBar = SnackBar(content: Text("글 삭제 실패"));
  //   //   ScaffoldMessenger.of(mContext!).showSnackBar(snackBar);
  //   // }
  // }

  Future<void> updateAccount(String brand, String accountNumber)async{
    MyAccountReqDTO myAccountReqDTO = MyAccountReqDTO(brand: brand, accountNumber: accountNumber);
    SessionUser sessionUser = ref.read(sessionProvider);

    ResponseDTO responseDTO = await MyAccountRepository().fetchAccountSave(myAccountReqDTO, sessionUser.jwt!);
    ref.read(userAccountPageProvider.notifier).notifyUpdate(responseDTO.data);
    Navigator.pop(mContext!);
  }

  Future<void> saveAccount(String brand, String accountNumber) async{
    MyAccountReqDTO myAccountReqDTO = MyAccountReqDTO(brand: brand, accountNumber: accountNumber);
    SessionUser sessionUser = ref.read(sessionProvider);

    ResponseDTO responseDTO = await MyAccountRepository().fetchAccountSave(myAccountReqDTO, sessionUser.jwt!);
    ref.read(userAccountPageProvider.notifier).notifyAdd(responseDTO.data);
    Navigator.pop(mContext!);
  }
}