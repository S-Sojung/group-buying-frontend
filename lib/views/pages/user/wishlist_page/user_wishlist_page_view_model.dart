
import 'package:donut/dto/board/mypage_board.dart';
import 'package:donut/dto/my_page/my_wishlist.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/board/board_repository.dart';
import 'package:donut/model/wishlist/wishlist_repository.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final userWishlistPageProvider = StateNotifierProvider<UserWishlistPageViewModel, UserWishlistPageModel?>((ref) {
  SessionUser sessionUser = ref.read(sessionProvider);
  return UserWishlistPageViewModel(null)..notifyInit(sessionUser.jwt!);
  //watch를 통해서 대기하고 있다가 값이 들어오면 바로 다시 그려진다.
});


//창고 데이터
//이 데이터의 형태가 하나가 아닐 수 도 있기 때문에 따로 이렇게 관리하는 것.
class UserWishlistPageModel{
  MyWishBoardList myWishBoardList;
  UserWishlistPageModel({required this.myWishBoardList});
}


//창고 : Store
class UserWishlistPageViewModel extends StateNotifier<UserWishlistPageModel?>{
  UserWishlistPageViewModel(super.state);

  // void notifyInit(List<Post> newPosts){
  void notifyInit(String jwt) async{
    ResponseDTO responseDTO = await MyWishRepository().fetchMyWishList(jwt);
    MyWishBoardList dto = responseDTO.data;
    state = UserWishlistPageModel(myWishBoardList: dto);
  }

  //추가 : 창고가 List형태(컬렉션) 이 아니라면 필요없다.
  void notifyAdd(WishlistListData board){
    MyWishBoardList wish = state!.myWishBoardList;
    wish.wishlistList = [... wish.wishlistList, board.wishlist];
    state = UserWishlistPageModel(myWishBoardList: wish);
  }
  // //삭제
  void notifyRemove(int id){
    MyWishBoardList wish = state!.myWishBoardList;

    wish.wishlistList = wish.wishlistList.where((e) => e.id != id).toList();
    //true 인 값만 toList에 넣어준다.
    state = UserWishlistPageModel(myWishBoardList: wish);
  }
  // //수정
  // void notifyUpdate(Post post){
  //   List<Post> posts = state!.posts;
  //   List<Post> newPosts = posts.map((e) => e.id == post.id ? post : e).toList();
  //   state = PostHomePageModel(posts: newPosts);
  // }

  void notifyMyBoardUpdate(String jwt) async {
    notifyInit(jwt);
  }
}

