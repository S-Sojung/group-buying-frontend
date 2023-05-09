import 'package:donut/core/constants/theme.dart';
import 'package:donut/dto/board/board_detail.dart';
import 'package:donut/views/pages/board/selete_participant_page/component/select_participant_body.dart';
import 'package:donut/views/pages/board/selete_participant_page/component/select_participant_header.dart';
import 'package:flutter/material.dart';

class SelectParticipantPage extends StatelessWidget {
  BoardDetail board;
  SelectParticipantPage({required this.board, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: donutColorBasic,
            backgroundColor: Colors.white10,
            title: Text("예약자 선택"),
          ),
          SeleteParticipantHeader(board: board),
          SelectParticipantBody(board: board),
        ],
      ),
    );
  }
}
