import 'dart:async';

import 'package:donut/views/pages/board/home_page/board_home_page.dart';
import 'package:donut/views/pages/splash/after_splash_page/after_splash_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    var duration = Duration(seconds: 5);
    return Timer(duration, () {
      //SessionUser sessionUser = ref.read(sessionProvider);
      //sessionUser.isLogin! ? ( 1 == 1 ? Move.boardHomePage : Move.boardHomePage) : Move.loginPage,
      //여기서 세션이랑 확인하고 이동할 구간 정해야함.
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            // builder: (context) => BoardHomePage(),
            builder: (context) => AfterSplashPage(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 500,
              height: 500,
              child: Lottie.network(
                  // "https://assets3.lottiefiles.com/packages/lf20_pjdN0Y.json",
                  "https://assets4.lottiefiles.com/packages/lf20_pjdN0Y.json"),
            )
          ],
        ),
      ),
    );
  }
}
