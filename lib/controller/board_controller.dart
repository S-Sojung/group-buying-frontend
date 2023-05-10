import 'dart:ffi';
import 'dart:io';

import 'package:donut/core/constants/move.dart';
import 'package:donut/dto/board/board_detail.dart';
import 'package:donut/dto/board/save_board_req.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/main.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/board/board_repository.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/pages/board/home_page/board_home_page_view_model.dart';
import 'package:donut/views/pages/user/boardlist_page/user_boardlist_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final boardControllerProvider = Provider<BoardController>((ref) {
  return BoardController(ref);
});

class BoardController {
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

  Future<void> savePost(File? img,
      int categoryId, String title, String content,
      String state, String city, String town, double latitude,
      double longtitude, int qty, String paymentType, DateTime endAt,
      int price, List<dynamic> comment) async {
    SessionUser sessionUser = ref.read(sessionProvider);

    BoardSaveReq boardSaveReq = BoardSaveReq(categoryId: 1,
        title: "${title}",
        content: "${content}",
        state: "${state}",
        city: "${city}",
        town: "${town}",
        latitude: latitude,
        longtitude: longtitude,
        qty: qty,
        paymentType: "${paymentType}",
        endAt: endAt,
        price: price,
        comment: comment);
    ResponseDTO responseDTO = await BoardRepository().fetchSave(
        boardSaveReq, sessionUser.jwt!);

    print("파싱 데이터 확인 : ${responseDTO.data}");
    BoardDetailDto boardDetailDto = responseDTO.data;

    Board board = Board(
        id: boardDetailDto.board.id,
        title: boardDetailDto.board.title,
        img: boardDetailDto.board.img!,
        state: boardDetailDto.board.state,
        city: boardDetailDto.board.city,
        town: boardDetailDto.board.town,
        price: boardDetailDto.board.event.price,
        qty: boardDetailDto.board.event.qty,
        latitude: boardDetailDto.board.event.latitude,
        longtitude: boardDetailDto.board.event.longtitude,
        paymentType: boardDetailDto.board.event.paymentType,
        recommend: boardDetailDto.board.recommend,
        endAt: boardDetailDto.board.event.endAt
    );

    ref.read(boardHomePageProvider.notifier).notifyAdd(board);
    ref.read(userBoardlistPageProvider.notifier).notifyMyBoardUpdate(sessionUser.jwt!);
    Navigator.pushNamedAndRemoveUntil(mContext!, Move.boardHomePage, (route) => false);
  }

  Future<void> refresh() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ref.read(boardHomePageProvider.notifier).notifyInit(sessionUser.jwt!);
  }

  // Future<void> searchRefresh() async {
  //   SessionUser sessionUser = ref.read(sessionProvider);
  //   ref.read(boardHomePageProvider.notifier).notifyInit(sessionUser.jwt!);
  // }
}