import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/views/pages/user/purchase_history_page/components/user_purchase_history_tabar_view.dart';
import 'package:donut/views/pages/user/purchase_history_page/components/user_purchase_history_tabbar.dart';
import 'package:flutter/material.dart';

class UserPurchaseHistoryPage extends StatefulWidget {
  const UserPurchaseHistoryPage({Key? key}) : super(key: key);

  @override
  State<UserPurchaseHistoryPage> createState() =>
      _UserPurchaseHistoryPageState();
}

class _UserPurchaseHistoryPageState extends State<UserPurchaseHistoryPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            child: USerPurchaseHistoryTabbarView(tabController: _tabController,ongoing: boards,completion: boards),
          )
        ],
      ),
    );
  }
}
