import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/pages/user/boardlist_page/user_boardlist_page.dart';
import 'package:donut/views/pages/user/detail_page/components/donut_text_button.dart';
import 'package:donut/views/pages/user/detail_page/components/user_header.dart';
import 'package:flutter/material.dart';



class UserOtherDetailPage extends StatelessWidget {
  const UserOtherDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        foregroundColor: donutColorBasic,
        actions: [DonutPopupMenuButton()],
      ),
      body: Column(
        children: [
          UserHeader(),
          DonutTextButton(
              icon: Icons.shopping_basket_outlined, text: "판매 상품", funRoute: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => UserBoardlistPage())); //여기에 유저도 넣어야겠다.
          })
        ],
      ),
    );
  }
}


enum MenuTypeOwn {
  first,
  second
}

class DonutPopupMenuButton extends StatelessWidget {

  const DonutPopupMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuTypeOwn>(
      onSelected: (MenuTypeOwn result) {
        // 신고하는 곳으로
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
        // value.name=="first"? "신고 하기" : "차단하기"
        print(result.name);
      },
      itemBuilder: (BuildContext buildContext) {
        return [
          for (final value in MenuTypeOwn.values)
            PopupMenuItem(
              value: value,
              child: Text(value.name=="first"? "신고 하기" : "차단 하기"),
            )
        ];
      },
    );
  }
}