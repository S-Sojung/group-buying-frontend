import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/views/pages/user/boardlist_page/components/user_board_list_tabar_view.dart';
import 'package:donut/views/pages/user/boardlist_page/components/user_board_list_tabbar.dart';
import 'package:flutter/material.dart';

class UserBoardlistPage extends StatefulWidget {
  const UserBoardlistPage({Key? key}) : super(key: key);

  @override
  State<UserBoardlistPage> createState() => _UserBoardlistPageState();
}

class _UserBoardlistPageState extends State<UserBoardlistPage>
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
          title: Text("올린 글"),
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
          UserBoardListTabbar(tabController: _tabController, tabTitle: ["판매 중","판매 완료"]),
          Expanded(
            child: UserBoardListTabbarView(tabController: _tabController,ongoing: boards,completion: boards),
          )
        ],
      ),
    );
  }
}
