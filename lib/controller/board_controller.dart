import 'package:donut/main.dart';
import 'package:donut/model/board/board_repository.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/pages/board/home_page/board_home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final boardControllerProvider = Provider<BoardController>((ref) {
  return BoardController(ref);
});

class BoardController{
  // Repository, ViewModel 의존
  final mContext = navigatorKey.currentContext; //최상위 화면: 현재 위치
  final Ref ref;
  BoardController(this.ref);

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

  // Future<void> updatePost(int id, String title, String content) async{
  //   PostUpdateReqDTO postUpdateReqDTO = PostUpdateReqDTO(title: title, content: content);
  //   SessionUser sessionUser = ref.read(sessionProvider);
  //
  //   ResponseDTO responseDTO = await PostRepository().fetchUpdate(id, postUpdateReqDTO, sessionUser.jwt!);
  //
  //   ref.read(postDetailPageProvider(id).notifier).notifyUpdate(responseDTO.data);
  //   ref.read(postHomePageProvider.notifier).notifyUpdate(responseDTO.data);
  //   Navigator.pop(mContext!);
  // }
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

  Future<void> refresh() async{
    SessionUser sessionUser = ref.read(sessionProvider);
    ref.read(boardHomePageProvider.notifier).notifyInit(sessionUser.jwt!);
  }
}