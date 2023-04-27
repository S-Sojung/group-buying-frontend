import 'package:donut/core/constants/size.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/views/pages/board/home_page/component/board_category_appbar.dart';
import 'package:donut/views/components/board_list_tile.dart';
import 'package:donut/views/components/board_list.dart';
import 'package:flutter/material.dart';

class BoardHomeListPage extends StatelessWidget {

  const BoardHomeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BoardCategoryAppbar(),
        BoardList(boards: boards,listSize: 0.75),
      ],
    );
  }
}