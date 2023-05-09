import 'package:donut/core/constants/theme.dart';
import 'package:donut/dto/board/board_home_page_response_dto.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/board/mock_board.dart';
import 'package:donut/views/pages/board/home_page/board_home_page_view_model.dart';
import 'package:donut/views/pages/user/boardlist_page/components/user_board_list_tabar_view.dart';
import 'package:donut/views/pages/user/boardlist_page/components/user_board_list_tabbar.dart';
import 'package:donut/views/pages/user/boardlist_page/user_boardlist_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserBoardlistPage extends ConsumerStatefulWidget {
  const UserBoardlistPage({Key? key}) : super(key: key);

  @override
  UserBoardlistPageState createState() => UserBoardlistPageState();
}

class UserBoardlistPageState extends ConsumerState<UserBoardlistPage>
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
    // BoardHomePageModel? model = ref.watch(boardHomePageProvider);
    UserBoardlistPageModel? model = ref.watch(userBoardlistPageProvider);

    if (model != null) {
      model.myPageBoard.board.forEach((element) {
        Board board = Board(
            id:element.id,
            title: element.title,
            img: element.img!,
            state: element.state,
            city: element.city,
            town: element.town,
            price: element.event.price,
            qty: element.event.qty,
            latitude: element.event.latitude,
            longtitude: element.event.longtitude,
            paymentType: element.event.paymentType,
            recommend: element.recommend,
            endAt: element.event.endAt);
        boardlist.add(board);
      });
    }
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
          UserBoardListTabbar(
              tabController: _tabController, tabTitle: ["판매 중", "판매 완료"]),
          Expanded(
            child: UserBoardListTabbarView(tabController: _tabController,
                ongoing: boardlist,
                completion: boardlist),
          )
        ],
      ),
    );
  }
}
