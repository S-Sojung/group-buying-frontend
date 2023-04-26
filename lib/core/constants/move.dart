import 'package:donut/views/pages/auth/join_page/join_page.dart';
import 'package:donut/views/pages/auth/login_page/login_page.dart';
import 'package:donut/views/pages/board/home_page/board_home_page.dart';
import 'package:donut/views/pages/board/map_page/board_map_page.dart';
import 'package:donut/views/pages/board/write_page/board_write_first_page.dart';
import 'package:flutter/material.dart';


class Move {
  Move._single();


  static String joinPage = "/join";
  static String loginPage = "/login";
  static String boardHomePage = "/board/home";
  static String boardMapPage = "/board/map";
  static String boardWritePage = "/board/write";

}


Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.joinPage: (context) => JoinPage(),
    Move.loginPage: (context) => LoginPage(),
    Move.boardHomePage: (context) => BoardHomePage(),
    Move.boardWritePage: (context) => BoardWriteFirstPage(),
  };
}