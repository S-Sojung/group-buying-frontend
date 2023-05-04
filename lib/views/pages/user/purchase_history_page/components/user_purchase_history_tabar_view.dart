import 'package:donut/model/board/board.dart';
import 'package:donut/model/board/mock_board.dart';
import 'package:donut/views/components/board_list.dart';
import 'package:flutter/material.dart';

class USerPurchaseHistoryTabbarView extends StatelessWidget {
  final tabController;
  final List<Board> ongoing;
  final List<Board> completion;

  const USerPurchaseHistoryTabbarView({required this.tabController, required this.ongoing, required this.completion, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        CustomScrollView(
          slivers: [
            BoardList(
              boards: ongoing,
            ),
          ],
        ),
        CustomScrollView(
          slivers: [
            BoardList(
              boards: completion,
            ),
          ],
        )
      ],
    );
  }
}
