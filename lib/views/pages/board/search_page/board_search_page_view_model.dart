
import 'package:donut/dto/board/board_home_page_response_dto.dart';
import 'package:donut/dto/board/board_search_res.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/main.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/board/board_repository.dart';
import 'package:donut/model/my_location/my_location.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/pages/user/hometown_page/user_set_hometown_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final boardSearchPageProvider = StateNotifierProvider.family.autoDispose<BoardSearchPageViewModel, BoardSearchPageModel? ,String> ((ref,word) {
  SessionUser sessionUser = ref.read(sessionProvider);
  return BoardSearchPageViewModel(null)..notifyInit(sessionUser.jwt!, word);
  //watch를 통해서 대기하고 있다가 값이 들어오면 바로 다시 그려진다.
});


//창고 데이터
//이 데이터의 형태가 하나가 아닐 수 도 있기 때문에 따로 이렇게 관리하는 것.
class BoardSearchPageModel{
  List<BoardSearchRes> boards;

  BoardSearchPageModel({required this.boards});
}


//창고 : Store
class BoardSearchPageViewModel extends StateNotifier<BoardSearchPageModel?>{
  BoardSearchPageViewModel(super.state);

  final mContext = navigatorKey.currentContext; //최상위 화면: 현재 위치
  void notifyInit(String jwt, String word) async{
    ResponseDTO responseDTO = await BoardRepository().fetchSearchPostList(jwt, word);

      List<BoardSearchRes> dto = responseDTO.data;

      state = BoardSearchPageModel(boards: dto);
  }
}

