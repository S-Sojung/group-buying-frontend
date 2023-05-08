import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/model/my_account/my_account.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_label_round_textbox.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:donut/views/pages/user/account_page/user_set_account_page.dart';
import 'package:flutter/material.dart';

class SelectAccountBody extends StatefulWidget {
  const SelectAccountBody({Key? key}) : super(key: key);

  @override
  State<SelectAccountBody> createState() => _SelectAccountBodyState();
}

class _SelectAccountBodyState extends State<SelectAccountBody> {
  MyAccount myAccounts = MyAccount(id: 1, userId: 1, brand: "농협", accountNumber: "0000000000000");


  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(context) * 0.05, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DonutLabelRoundTextbox(title: "${myAccounts.brand}", content: "${myAccounts.accountNumber}"),

            SizedBox(height: 350,),
            DonutButton(text: "계좌 변경하러 가기 ", funPageRoute: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserSetAccountPage(),));
            }),
            SizedBox(height: 30,),
            DonutButton(text: "예약중으로 변경하고 채팅하기", funPageRoute: (){}),
          ],
        ),
      ),
    );
  }
}
