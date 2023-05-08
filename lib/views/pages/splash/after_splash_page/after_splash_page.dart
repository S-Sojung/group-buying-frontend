import 'package:donut/core/constants/move.dart';
import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class AfterSplashPage extends StatelessWidget {
  const AfterSplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        await _onBackPressed(context);
        return false;
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 1,), 
              Image.asset("assets/images/donutmarket_logo.png", width: getScreenWidth(context)*0.7,height: getScreenWidth(context)*0.7),
              Column(
                children: [
                  DonutButton(text: "시작 하기", funPageRoute: (){
                    Navigator.pushNamed(context, Move.joinPage);
                  }),
                  TextButton(child: Text.rich(TextSpan(
                      text: "이미 계정이 있나요?  ", style: bodyText(),
                      children: <TextSpan>[
                        TextSpan(text: "로그인",style: bodyText(mColor: donutColorBasic)),
                      ]
                  ) ),onPressed: (){
                    Navigator.pushNamed(context, Move.loginPage);
                  } )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onBackPressed(BuildContext context) async{
    await showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("정말로 앱을 종료하시나요?"),
      actions: <Widget>[
        TextButton(onPressed: ()=>Navigator.pop(context), child: Text("아니요")),
        TextButton(onPressed: ()=>SystemNavigator.pop(), child: Text("네"))
      ],
    ),
    );
  }

}
