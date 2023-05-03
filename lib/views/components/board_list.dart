import 'package:donut/core/constants/size.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/views/components/board_list_tile.dart';
import 'package:flutter/material.dart';

class BoardList extends StatelessWidget {
  final listSize;
  final List<MocBoard> boards;
  const BoardList({
    this.listSize = 1.0, required this.boards, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        height: getScreenHeigth(context)*listSize,
        child: ListView.builder(
          itemCount: boards.length, // 선택한 게시글 갯수
          itemBuilder: (context, index) {
            //게시글 넘겨주기
            return BoardListTile(boards[index]);
          },
        ),
      ),
    );
  }
}
