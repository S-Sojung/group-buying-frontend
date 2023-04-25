
import 'package:donut/model/board/board.dart';
import 'package:donut/views/pages/board/detail_page/component/board_detail_body_content.dart';
import 'package:donut/views/pages/board/detail_page/component/board_detail_bottom.dart';
import 'package:donut/views/pages/board/detail_page/component/board_detail_header.dart';
import 'package:flutter/material.dart';

class BoardDetailBody extends StatelessWidget {
  final Board board;

  BoardDetailBody({required this.board, Key? key}) : super(key: key);

//  List<String> tags = [events[board.eventId].paymentType];
  List<String> tags = ["모집 중", "앱결제", "식품", "#편의점", "#삼김"];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BoardDetailHeader(),
        BoardDetailBodyContent(board: board, tags: tags),
        BoardDetailBottom(),
      ],
    );
  }
}
