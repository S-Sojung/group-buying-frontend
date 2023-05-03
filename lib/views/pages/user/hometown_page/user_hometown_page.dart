import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/my_location/my_location.dart';
import 'package:donut/model/user/donutuser.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/pages/user/hometown_page/user_set_hometown_page.dart';
import 'package:flutter/material.dart';

class UserHometownPage extends StatelessWidget {
  const UserHometownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          foregroundColor: donutColorBasic,
          title: Text("현재 내 동네 "),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                )),
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05,vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('이 주소를 기반해서 \n주변에 있는 공구들을 리스트로 보여줘요!', style: bodyText()),
            SizedBox(height: 50,),
            Container(
              width: getScreenWidth(context),
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: donutColorBasic,width: 2),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Align(alignment: Alignment.center,child: Text("${myLocations[0].state} ${myLocations[0].city} ${myLocations[0].town}",style: title2(),)),
            ),
            SizedBox(height: 50,),
            // DonutButton(text: "내 동네 인증하기", funPageRoute: (){
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => UserSetHometownPage(),));
            // }),
            //
            // SizedBox(height: 20,),
            DonutButton(text: "내 동네 다시 설정하기", funPageRoute: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserSetHometownPage(),));
            })
          ],
        ),
      ),
    );
  }
}