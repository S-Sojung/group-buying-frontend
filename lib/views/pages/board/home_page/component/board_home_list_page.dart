import 'package:donut/core/constants/size.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/views/pages/board/home_page/board_home_page_view_model.dart';
import 'package:donut/views/pages/board/home_page/component/board_category_appbar.dart';
import 'package:donut/views/components/board_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoardHomeListPage extends ConsumerWidget {

  List<Board> boards = [];
  BoardHomeListPage({required this.boards, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {


    return CustomScrollView(
      slivers: [
        BoardCategoryAppbar(),
        BoardList(boards: boards,listSize: 0.75),
      ],
    );
  }
}