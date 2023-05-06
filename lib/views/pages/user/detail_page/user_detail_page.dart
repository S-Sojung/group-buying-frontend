
import 'package:donut/model/user/donutuser.dart';
import 'package:donut/model/user/user.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/pages/user/detail_page/components/user_my_detail_page.dart';
import 'package:donut/views/pages/user/detail_page/user_other_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class UserDetailPage extends ConsumerWidget {
  UserDetailPage({required this.user, Key? key}) : super(key: key);

  DoUser user;
  //SessionUser principalUser
  //들어온게 본인인지 아닌지 권한 체크
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser sessionUser = ref.read(sessionProvider);
    return user.id == sessionUser.user!.user.id ? UserMyDetailPage() : UserOtherDetailPage(user: user,);
    //return user.id==principalUser.id ? UserMyDetailPage() : UserOtherDetailPage
    // return UserOtherDetailPage();
    return UserMyDetailPage();
  }
}
