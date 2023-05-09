import 'package:donut/core/constants/move.dart';
import 'package:donut/core/constants/size.dart';
import 'package:donut/views/pages/auth/login_page/components/login_form.dart';
import 'package:donut/views/pages/auth/login_page/components/login_header.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getScreenWidth(context) * 0.05,vertical: getScreenHeigth(context)*0.01),
        child: ListView(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LoginHeader(),
                  LoginForm(),
                  TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, Move.joinPage);
                    },
                    child: const Text("아직 회원가입이 안되어 있나요?"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
