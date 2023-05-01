import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/views/components/board_list.dart';
import 'package:flutter/material.dart';


class UserWishlistPage extends StatelessWidget {

  UserWishlistPage({Key? key}) : super(key: key);

  List<Board> wishboards = boards;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          foregroundColor: donutColorBasic,
          title: Text("관심 게시글 목록"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                )),
          ]),
      body: CustomScrollView(
        slivers: [
          BoardList(
            boards: boards,
          ),
        ],
      ),
    );
  }
}