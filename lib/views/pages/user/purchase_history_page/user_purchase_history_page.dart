import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/board/mock_board.dart';
import 'package:donut/views/pages/board/home_page/board_home_page_view_model.dart';
import 'package:donut/views/pages/user/purchase_history_page/components/user_purchase_history_tabar_view.dart';
import 'package:donut/views/pages/user/purchase_history_page/components/user_purchase_history_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPurchaseHistoryPage extends ConsumerStatefulWidget {
  const UserPurchaseHistoryPage({Key? key}) : super(key: key);

  @override
  UserPurchaseHistoryPageState createState() =>
      UserPurchaseHistoryPageState();
}

class UserPurchaseHistoryPageState extends ConsumerState<UserPurchaseHistoryPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Board> boardlist = [];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BoardHomePageModel? model = ref.watch(boardHomePageProvider);
    if (model != null) {
      boardlist = model.BHPRdto.boards;
    }
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          foregroundColor: donutColorBasic,
          title: Text("구매 내역"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                )),
          ]),
      body: Column(
        children: [
          USerPurchaseHistoryTabbar(tabController: _tabController, tabTitle: ["구매 중","구매 완료"]),
          Expanded(
            child: USerPurchaseHistoryTabbarView(tabController: _tabController,ongoing: boardlist,completion: boardlist),
          )
        ],
      ),
    );
  }
}
