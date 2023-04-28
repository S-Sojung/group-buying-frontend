import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_label_round_textbox.dart';
import 'package:donut/views/components/donut_result_text_field.dart';
import 'package:donut/views/pages/user/account_page/user_set_account_page.dart';
import 'package:flutter/material.dart';

class UserAccountPage extends StatelessWidget {
  const UserAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          foregroundColor: donutColorBasic,
          title: Text("계좌 번호"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                )),
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05,vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('공동구매 주최 시 앱 결제를 할 경우, \n해당 계좌로 돈이 들어옵니다.', style: bodyText()),
                DonutLabelRoundTextbox(
                  title: "ㅁㅁ 은행",
                  content: "0000-0000-00000", //10~14
                ),
              ],
            ),
            //현재 등록된 계좌가 없으면? Text(등록된 계좌가 없습니다), 등록해 주세요.
            DonutButton(text: "계좌 변경하기", funPageRoute: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserSetAccountPage(),));
            })
          ],
        ),
      ),
    );
  }
}
