import 'dart:async';

import 'package:donut/core/constants/move.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/pages/board/home_page/board_home_page.dart';
import 'package:donut/views/pages/splash/after_splash_page/after_splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();
    ref.read(sessionProvider);
    startTimer();
  }

  startTimer() {
    var duration = Duration(seconds: 5);
    return Timer(duration, () {
      SessionUser sessionUser = ref.read(sessionProvider);
      //      // 로그인 상태일 경우, 내 위치 가 설정되어 있지 않다면? 내 위치 설정으로 가기
      //여기서 세션이랑 확인하고 이동할 구간 정해야함.
      Navigator.pushNamedAndRemoveUntil(context, sessionUser.isLogin! ? ( 1 == 1 ? Move.boardHomePage : Move.boardHomePage) : Move.afterSplashPage, (route) => false);
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
