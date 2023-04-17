import 'package:flutter/material.dart';


class Move {
  // static String postHomePage = "/post/home";
  static String joinPage = "/join";
  static String loginPage = "/login";
}


Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    // Move.joinPage: (context) => JoinPage(),
    // Move.loginPage: (context) => LoginPage(),
  };
}
