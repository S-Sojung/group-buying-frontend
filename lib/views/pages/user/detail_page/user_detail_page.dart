import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/rate/rate.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_rate_bar.dart';
import 'package:donut/views/pages/user/detail_page/components/donut_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  SizedBox(height: 100),
                  SvgPicture.asset("assets/images/donut.svg", height: 80, width: 80,
                  ),
                  Text("도넛이"),
                ],
              ),
              DonutRoundButton(text: "프로필수정", funPageRoute: (){}),
            ],
          ),
          DonutRateBar(rates[1]),
          Divider(color: donutColorBasic,thickness: 3),
          DonutTextButton(icon: Icon(Icons.ac_unit), text: "관심 카테고리 설정", funRoute: (){}),
          DonutTextButton(icon: Icon(Icons.ac_unit), text: "구매 내역", funRoute: (){}),
          DonutTextButton(icon: Icon(Icons.ac_unit), text: "내가 올린 글", funRoute: (){}),
          DonutTextButton(icon: Icon(Icons.ac_unit), text: "계좌번호 등록", funRoute: (){}),
          DonutTextButton(icon: Icon(Icons.ac_unit), text: "우리 동네 설정", funRoute: (){}),
          Divider(color: donutColorBasic,thickness: 3),
          DonutTextButton(icon: Icon(Icons.add_alert), text: "알람 설정", funRoute: (){}),
          DonutTextButton(icon: Icon(Icons.add_alert), text: "기타 설정", funRoute: (){}),
          Divider(color: donutColorBasic,thickness: 3),
          DonutTextButton(icon: Icon(Icons.add_alert), text: "차단 목록 관리", funRoute: (){}),
          DonutTextButton(icon: Icon(Icons.add_alert), text: "신고 목록 관리", funRoute: (){}),
          Divider(color: donutColorBasic,thickness: 3),
          DonutTextButton(icon: Icon(Icons.add_alert), text: "공지사항", funRoute: (){}),
        ],
      ),
    );
  }
}

