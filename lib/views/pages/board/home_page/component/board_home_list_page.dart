import 'package:donut/core/constants/size.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/views/pages/board/home_page/component/board_category_appbar.dart';
import 'package:donut/views/pages/board/home_page/component/board_list_tile.dart';
import 'package:flutter/material.dart';

class BoardHomeListPage extends StatelessWidget {

  const BoardHomeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BoardCategoryAppbar(),
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            height: getScreenHeigth(context)*0.75,
            child: ListView.builder(
              itemCount: boards.length, // 선택한 게시글 갯수
              itemBuilder: (context, index) {
                //게시글 넘겨주기
                return BoardListTile(boards[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}