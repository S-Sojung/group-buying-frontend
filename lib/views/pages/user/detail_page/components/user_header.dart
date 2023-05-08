import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/rate/rate.dart';
import 'package:donut/model/user/user.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_rate_bar.dart';
import 'package:donut/views/pages/user/detail_page/profile_update_page/profile_update_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserHeader extends StatelessWidget {
  DoUser user;
  UserHeader({required this.user, Key? key}) : super(key: key);

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
                user.profile == null?
                SvgPicture.asset(
                  "assets/images/donut.svg",
                  height: 70,
                  width: 70,
                ):
                Image(image: NetworkImage(user.profile)),
                SizedBox(width: 15,),
                Text("${user.nickname}",style: headLine(),),
              ],
            ),
            DonutRoundButton(text: "프로필수정", funPageRoute: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileUpdatePage(),));
            }),
          ],
        ),
        DonutRateBar(user.rate, ratePoint: user.ratePoint),
        SizedBox(height: 10,),
        Divider(color: donutColorBasic,thickness: 1),
      ],
    );
  }
}
