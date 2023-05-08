
import 'package:donut/dto/my_page/my_account_dto.dart';
import 'package:donut/dto/my_page/my_location_dto.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/my_account/my_account.dart';
import 'package:donut/model/my_account/my_account_repository.dart';
import 'package:donut/model/my_location/my_location.dart';
import 'package:donut/model/my_location/my_location_repository.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final userAccountPageProvider = StateNotifierProvider<UserAccountPageViewModel, UserAccountPageModel?>((ref) {
  SessionUser sessionUser = ref.read(sessionProvider);
  return UserAccountPageViewModel(null)..notifyInit(sessionUser.jwt!);
  //watch를 통해서 대기하고 있다가 값이 들어오면 바로 다시 그려진다.
});


//창고 데이터
//이 데이터의 형태가 하나가 아닐 수 도 있기 때문에 따로 이렇게 관리하는 것.
class UserAccountPageModel{
  MyAccount myAccount;
  UserAccountPageModel({required this.myAccount});
}


//창고 : Store
class UserAccountPageViewModel extends StateNotifier<UserAccountPageModel?>{
  UserAccountPageViewModel(super.state);

  // void notifyInit(List<Post> newPosts){
  void notifyInit(String jwt) async{
    ResponseDTO responseDTO = await MyAccountRepository().fetchMyAccount(jwt);
    MyAccount dto = responseDTO.data;
    state = UserAccountPageModel(myAccount: dto);
  }

//추가 : 창고가 List형태(컬렉션) 이 아니라면 필요없다.
  void notifyAdd(MyAccount account){
    state = UserAccountPageModel(myAccount: account);
  }
// //삭제
// void notifyRemove(int id){
//   List<Post> posts = state!.posts;
//   List<Post> newPosts = posts.where((e) => e.id != id).toList();
//   //true 인 값만 toList에 넣어준다.
//   state = PostHomePageModel(posts: newPosts);
// }
// //수정
  void notifyUpdate(MyAccount account){
    state = UserAccountPageModel(myAccount: account);
  }
}

