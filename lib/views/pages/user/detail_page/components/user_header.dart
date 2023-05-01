import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/rate/rate.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_rate_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                SizedBox(height: 100),
                SvgPicture.asset(
                  "assets/images/donut.svg",
                  height: 70,
                  width: 70,
                ),
                SizedBox(width: 15,),
                Text("도넛이",style: headLine(),),
              ],
            ),
            DonutRoundButton(text: "프로필수정", funPageRoute: () {}),
          ],
        ),
        DonutRateBar(rates[1]),
        SizedBox(height: 10,),
        Divider(color: donutColorBasic,thickness: 1),
      ],
    );
  }
}
