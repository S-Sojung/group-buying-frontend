import 'package:donut/core/constants/move.dart';
import 'package:donut/core/constants/size.dart';
import 'package:donut/views/pages/auth/join_page/components/join_form.dart';
import 'package:donut/views/pages/auth/join_page/components/join_header.dart';
import 'package:flutter/material.dart';

class JoinBody extends StatelessWidget {
  JoinBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context) * 0.05),
        child: ListView(
          children: [
            JoinHeader(),
            JoinForm(),
            TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, Move.loginPage);
              },
              child: const Text("이미 회원가입 한 유저인가요?"),
            )
          ],
        ),
      ),
    );
  }
}


