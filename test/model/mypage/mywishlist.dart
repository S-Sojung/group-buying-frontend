import 'package:donut/dto/my_page/my_wishlist_req.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/wishlist/wishlist_repository.dart';

void main() async {
  await fetchMyWishlist_test();
}

Future<void> fetchSaveMyWishlist_test() async {
  String jwt = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJyb2xlIjpudWxsLCJpZCI6NywiZXhwIjoxNjgzNjM0Nzk4fQ.jjrDK2x5xE14X8KjwtAlfhICR4k2WqYW6TUfCVjIJg4ifM0WnLU1rj4UjrOIAxIp20AfyipUpQDirUej0Rsnjg";

  WishSaveReq wishSaveReq = WishSaveReq(boardId: 1);
  ResponseDTO responseDTO =await MyWishRepository().fetchSave(wishSaveReq,jwt);
  print(responseDTO.status);
  print(responseDTO.msg);
  print(responseDTO.data);
}

Future<void> fetchMyWishlist_test() async {
  String jwt = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJyb2xlIjpudWxsLCJpZCI6NywiZXhwIjoxNjgzNjM0Nzk4fQ.jjrDK2x5xE14X8KjwtAlfhICR4k2WqYW6TUfCVjIJg4ifM0WnLU1rj4UjrOIAxIp20AfyipUpQDirUej0Rsnjg";

  ResponseDTO responseDTO =await MyWishRepository().fetchMyWishList(jwt);
  print(responseDTO.status);
  print(responseDTO.msg);
  print(responseDTO.data);
}