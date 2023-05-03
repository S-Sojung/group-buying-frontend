import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/views/pages/board/detail_page/component/board_detail_body.dart';
import 'package:flutter/material.dart';

class BoardDetailPage extends StatelessWidget {
  final MocBoard board;

  BoardDetailPage({required this.board, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        foregroundColor: donutColorBasic,
        actions: [DonutPopupMenuButton(),DonutPopupOwnMenuButton()],
      ),
      body: BoardDetailBody(
        board: board,
      ),
    );
  }
}


enum MenuTypeOwn {
  first
}

class DonutPopupMenuButton extends StatelessWidget {

  const DonutPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuTypeOwn>(
      onSelected: (MenuTypeOwn result) {
        // 신고하는 곳으로
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
        print("신고하기");
      },
      itemBuilder: (BuildContext buildContext) {
        return [
          for (final value in MenuTypeOwn.values)
            PopupMenuItem(
              value: value,
              child: Text("신고하기"),
            )
        ];
      },
    );
  }
}

class DonutPopupOwnMenuButton extends StatelessWidget {

  const DonutPopupOwnMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuTypeOwn>(
      onSelected: (MenuTypeOwn result) {
        // 수정페이지
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
        print("수정하기");
      },
      itemBuilder: (BuildContext buildContext) {
        return [
          for (final value in MenuTypeOwn.values)
            PopupMenuItem(
              value: value,
              child: Text("수정하기"),
            )
        ];
      },
    );
  }
}

