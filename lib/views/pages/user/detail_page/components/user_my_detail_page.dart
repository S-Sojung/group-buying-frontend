
import 'package:donut/controller/user_controller.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/pages/user/account_page/user_account_page.dart';
import 'package:donut/views/pages/user/boardlist_page/user_boardlist_page.dart';
import 'package:donut/views/pages/user/category_page/user_category_page.dart';
import 'package:donut/views/pages/user/detail_page/components/donut_text_button.dart';
import 'package:donut/views/pages/user/detail_page/components/user_header.dart';
import 'package:donut/views/pages/user/hometown_page/user_hometown_page.dart';
import 'package:donut/views/pages/user/purchase_history_page/user_purchase_history_page.dart';
import 'package:donut/views/pages/user/reportlist_page/user_reportlist_page.dart';
import 'package:donut/views/pages/user/wishlist_page/user_wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserMyDetailPage extends ConsumerWidget {
  const UserMyDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          UserHeader(),
          DonutTextButton(
              icon: Icons.favorite, text: "관심 게시글 목록", funRoute: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserWishlistPage()));
          }),
          DonutTextButton(
              icon: Icons.favorite_border, text: "관심 카테고리 설정", funRoute: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserCategoryPage()));
          }),
          DonutTextButton(
              icon: Icons.shopping_basket_sharp, text: "구매 내역", funRoute: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserPurchaseHistoryPage()));
          }),
          DonutTextButton(
              icon: Icons.shopping_basket_outlined, text: "내가 올린 글", funRoute: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserBoardlistPage()));
          }),
          DonutTextButton(
              icon: Icons.account_balance, text: "계좌번호 등록", funRoute: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserAccountPage()));
          }),
          DonutTextButton(
              icon: Icons.location_on, text: "내 동네", funRoute: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserHometownPage()));
          }),
          Divider(color: donutColorBasic, thickness: 1),
          DonutTextButton(
              icon: Icons.notifications, text: "알람 설정", funRoute: () {}),
          DonutTextButton(
              icon: Icons.settings, text: "기타 설정", funRoute: () {}),
          Divider(color: donutColorBasic, thickness: 1),
          DonutTextButton(
              icon: Icons.lock_person, text: "차단 목록 관리", funRoute: () {}),
          DonutTextButton(
              icon: Icons.report, text: "신고 목록 관리", funRoute: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserReposrtlistPage()));
          }),
          Divider(color: donutColorBasic, thickness: 1),
          DonutTextButton(
              icon: Icons.summarize_outlined, text: "공지사항", funRoute: () {}),
          DonutTextButton(
              icon: Icons.logout, text: "로그아웃", funRoute: () {
            ref.read(userControllerProvider).logout();
          }),
        ],
      ),
    );
  }

  /*
   Future<void> buttonLogoutPressed() async {
    try {
      await FlutterNaverLogin.logOut();
      setState(() {
        isLogin = false;
        accesToken = null;
        tokenType = null;
        name = null;
      });
    } catch (error) {
      _showSnackError(error.toString());
    }
  }
   */
}
