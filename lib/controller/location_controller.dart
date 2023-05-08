import 'package:donut/dto/my_page/my_location_dto.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/main.dart';
import 'package:donut/model/board/board_repository.dart';
import 'package:donut/model/my_location/my_location.dart';
import 'package:donut/model/my_location/my_location_repository.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/pages/board/home_page/board_home_page_view_model.dart';
import 'package:donut/views/pages/user/hometown_page/user_hometown_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final locationControllerProvider = Provider<LocationController>((ref) {
  return LocationController(ref);
});

class LocationController{
  // Repository, ViewModel 의존
  final mContext = navigatorKey.currentContext; //최상위 화면: 현재 위치
  final Ref ref;
  LocationController(this.ref);

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

  Future<void> updateLocation(String state, String city, String town) async{
    MyLocationUpdateReqDTO myLocationUpdateReqDTO = MyLocationUpdateReqDTO(state: state, city: city,town: town);
    SessionUser sessionUser = ref.read(sessionProvider);

    ResponseDTO responseDTO = await MyLocationRepository().fetchLocationUpdate(myLocationUpdateReqDTO, sessionUser.jwt!);


    ref.read(userHomeTownPageProvider.notifier).notifyUpdate(responseDTO.data);
    ref.read(boardHomePageProvider.notifier).notifyLocationUpdate(sessionUser.jwt!, town);
    Navigator.pop(mContext!);
  }
  //
  // Future<void> savePost( String title, String content) async{
  //   PostSaveReqDTO postSaveReqDTO = PostSaveReqDTO(title: title, content: content);
  //   SessionUser sessionUser = ref.read(sessionProvider);
  //
  //   ResponseDTO responseDTO = await PostRepository().fetchSave(postSaveReqDTO, sessionUser.jwt!);
  //
  //   ref.read(postHomePageProvider.notifier).notifyAdd(responseDTO.data);
  //   Navigator.pop(mContext!);
  // }
}