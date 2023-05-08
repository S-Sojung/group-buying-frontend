
import 'package:donut/dto/board/board_detail.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/board/board_repository.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

//autoDispose : 페이지가 pop되면 자동으로 소멸 시켜준다.
//family <, ,family의 데이터 타입>(ref, 받아올 매개변수)
//관리자 : 창고를 관리함
final boardDetailPageProvider = StateNotifierProvider.family.autoDispose<BoardDetailPageViewModel, BoardDetailPageModel?,int>((ref, postId) {

  SessionUser sessionUser = ref.read(sessionProvider);
  return BoardDetailPageViewModel(null, ref)..notifyInit(postId, sessionUser.jwt!);
  //watch를 통해서 대기하고 있다가 값이 들어오면 바로 다시 그려진다.
});


//창고 데이터
class BoardDetailPageModel{
  BoardDetailDto board;
  BoardDetailPageModel({required this.board});
}


//창고 : Store
class BoardDetailPageViewModel extends StateNotifier<BoardDetailPageModel?>{
  Ref ref;
  BoardDetailPageViewModel(super.state, this.ref);

  //창고 초기화 : 집어 넣을 필요없이 창고에서 들고오는 값이기 때문에 직접 통신
  void notifyInit(int id, String jwt) async{
    ResponseDTO responseDTO = await BoardRepository().fetchPost(id, jwt);
    state = BoardDetailPageModel(board: responseDTO.data);
  }

  //추가 : 창고가 List형태(컬렉션) 이 아니라면 필요없다.

  //삭제 -> 리스트도 삭제 해줘야함
  void notifyRemove(int id){
    BoardDetailDto board = state!.board;
    if(board.board.id == id){
      state = null;
    }
  }

  //api 수정 요청 -> 수정된 post를 돌려받음
  //수정 -> 리스트도 수정 해줘야함
  void notifyUpdate(BoardDetailDto updateBoard){
    state = BoardDetailPageModel(board: updateBoard);
  }
}

