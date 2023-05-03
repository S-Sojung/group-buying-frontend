
import 'package:donut/model/user/donutuser.dart';
import 'package:donut/views/pages/user/detail_page/components/user_my_detail_page.dart';
import 'package:flutter/material.dart';


class UserDetailPage extends StatelessWidget {
  UserDetailPage({required this.user, Key? key}) : super(key: key);

  DonutUser user;
  //SessionUser principalUser
  //들어온게 본인인지 아닌지 권한 체크
  @override
  Widget build(BuildContext context) {
    //return user.id==principalUser.id ? UserMyDetailPage() : UserOtherDetailPage
    // return UserOtherDetailPage();
    return UserMyDetailPage();
  }
}
