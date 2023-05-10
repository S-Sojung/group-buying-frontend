import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/board/mock_board.dart';
import 'package:donut/views/components/board_list.dart';
import 'package:donut/views/components/donut_appbar.dart';
import 'package:donut/views/pages/board/home_page/board_home_page_view_model.dart';
import 'package:donut/views/pages/user/wishlist_page/user_wishlist_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserWishlistPage extends ConsumerWidget {
  UserWishlistPage({Key? key}) : super(key: key);

  List<Board> boardlist = [];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserWishlistPageModel? model = ref.watch(userWishlistPageProvider);

    if (model != null) {
      boardlist = [];
      model.myWishBoardList.wishlistList.forEach((element) {
        Board board = Board(
            id: element.board.id,
            title: element.board.title,
            img: element.board.img!,
            state: element.board.state,
            city: element.board.city,
            town: element.board.town,
            price: element.board.event.price,
            qty: element.board.event.qty,
            latitude: element.board.event.latitude,
            longtitude: element.board.event.longtitude,
            paymentType: element.board.event.paymentType,
            recommend: element.board.recommend,
            endAt: element.board.event.endAt);
        boardlist.add(board);
      });
    }

    return Scaffold(
      appBar: subAppbar("관심 게시글 목록"),
      body: CustomScrollView(
        slivers: [
          boardlist.length == 0
              ? SliverToBoxAdapter(child: Container(height: getScreenHeigth(context)*0.5,child: Align(alignment: Alignment.center,child: Text("관심 게시글이 없습니다"))))
              : BoardList(
                  boards: boardlist,
                ),
        ],
      ),
    );
  }
}
