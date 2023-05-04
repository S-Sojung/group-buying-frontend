import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/board/mock_board.dart';
import 'package:donut/views/components/board_list.dart';
import 'package:donut/views/components/donut_appbar.dart';
import 'package:donut/views/pages/board/home_page/board_home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserWishlistPage extends ConsumerWidget {

  UserWishlistPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Board> boardlist = [];

      BoardHomePageModel? model = ref.watch(boardHomePageProvider);
      if (model != null) {
        boardlist = model.BHPRdto.boards;
      }

    return Scaffold(
      appBar:subAppbar("관심 게시글 목록"),
      body: CustomScrollView(
        slivers: [
          BoardList(
            boards: boardlist,
          ),
        ],
      ),
    );
  }
}