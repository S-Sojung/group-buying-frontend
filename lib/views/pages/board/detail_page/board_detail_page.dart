import 'package:donut/core/constants/theme.dart';
import 'package:donut/dto/board/board_detail.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/board/mock_board.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/pages/board/detail_page/board_detail_page_view_model.dart';
import 'package:donut/views/pages/board/detail_page/component/board_detail_body.dart';
import 'package:donut/views/pages/user/account_page/user_account_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardDetailPage extends ConsumerWidget {
  final Board board;

  BoardDetailPage({required this.board, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BoardDetailPageModel? model = ref.watch(boardDetailPageProvider(board.id));
    SessionUser sessionUser = ref.read(sessionProvider);
    List<String> tags = [];

    if (model == null) {
      return const CircularProgressIndicator();
    } else {
      BoardDetailDto boardDetailDto = model.board;

      tags.add(boardDetailDto.board.event.paymentType);
      boardDetailDto.tagList.forEach((element) {
        tags.add(element);
      });

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          foregroundColor: donutColorBasic,
          actions: [
            sessionUser.user!.user.id != boardDetailDto.board.organizer.id ?
            DonutPopupMenuButton() : DonutPopupOwnMenuButton()
          ],
        ),
        body: BoardDetailBody(
          sessionUser: sessionUser,
          boardDTO: boardDetailDto.board,
          tags: tags,
        ),
      );
    }
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

