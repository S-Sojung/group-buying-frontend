import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/pages/user/detail_page/components/donut_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AfterSplashPage extends StatelessWidget {
  const AfterSplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 1,),
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/donut.svg",
                  height: 200,
                  width: 200,
                ),
                Text(
                  "도넛 마켓",
                  style: donutTitle(),
                ),
              ],
            ),
            Column(
              children: [
                DonutButton(text: "시작 하기", funPageRoute: (){

                }),
                TextButton(child: Text.rich(TextSpan(
                    text: "이미 계정이 있나요?  ", style: bodyText(),
                    children: <TextSpan>[
                      TextSpan(text: "로그인",style: bodyText(mColor: donutColorBasic)),
                    ]
                ) ),onPressed: (){} )
              ],
            )
          ],
        ),
      ),
    );
  }
}
