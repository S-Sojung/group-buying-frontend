
import 'package:donut/dto/my_page/my_wishlist.dart';
import 'package:donut/dto/my_page/my_wishlist_req.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/main.dart';
import 'package:donut/model/wishlist/wishlist_repository.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/pages/user/wishlist_page/user_wishlist_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final myWishontrollerProvider = Provider<MyWishController>((ref) {
  return MyWishController(ref);
});

class MyWishController {
  // Repository, ViewModel 의존
  final mContext = navigatorKey.currentContext; //최상위 화면: 현재 위치
  final Ref ref;

  MyWishController(this.ref);

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

  Future<void> saveWish(int boardId) async {
    SessionUser sessionUser = ref.read(sessionProvider);
    WishSaveReq wishSaveReq = WishSaveReq(boardId: boardId);
    ResponseDTO responseDTO = await MyWishRepository().fetchSave(
        wishSaveReq, sessionUser.jwt!);

    WishlistListData wishlistList = responseDTO.data;

    ref.read(userWishlistPageProvider.notifier).notifyAdd(wishlistList);
  }

  Future<void> refresh() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    ref.read(userWishlistPageProvider.notifier).notifyInit(sessionUser.jwt!);
  }
}