import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/event/event.dart';
import 'package:donut/model/rate/rate.dart';
import 'package:donut/views/components/donut_rate_bar.dart';
import 'package:donut/views/pages/board/detail_page/component/board_detail_body.dart';
import 'package:donut/views/pages/board/home_page/component/board_category_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardDetailPage extends StatelessWidget {
  final Board board;

  BoardDetailPage({required this.board, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          foregroundColor: donutColorBasic,
          actions: [IconButton(onPressed: () {

          }, icon: Icon(Icons.more_vert))],
        ),
        body: BoardDetailBody(
          board: board,
        ),
    );
  }
}
