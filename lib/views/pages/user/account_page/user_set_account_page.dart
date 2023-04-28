import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/pages/user/account_page/components/user_set_account_body.dart';
import 'package:flutter/material.dart';

class UserSetAccountPage extends StatelessWidget {
  const UserSetAccountPage({Key? key}) : super(key: key);

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
      body: UserSetAccountBody(),
    );
  }
}
