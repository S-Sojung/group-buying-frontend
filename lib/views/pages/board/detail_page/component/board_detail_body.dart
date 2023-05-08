
import 'package:donut/dto/board/board_detail.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/pages/board/detail_page/component/board_detail_body_content.dart';
import 'package:donut/views/pages/board/detail_page/component/board_detail_bottom.dart';
import 'package:donut/views/pages/board/detail_page/component/board_detail_header.dart';
import 'package:flutter/material.dart';


class BoardDetailBody extends StatelessWidget {
  final BoardDetail boardDTO;
  List<String> tags = [];
  SessionUser sessionUser;
  BoardDetailBody({required this.boardDTO,required this.tags,required this.sessionUser, Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BoardDetailHeader(board: boardDTO,),
        BoardDetailBodyContent(board: boardDTO, tags: tags),
        BoardDetailBottom(board: boardDTO,sessionUser: sessionUser),
      ],
    );
  }
}
