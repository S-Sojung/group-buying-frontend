import 'dart:async';

import 'package:donut/core/constants/move.dart';
import 'package:donut/provider/session_provider.dart';
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
    initialization();
    ref.read(sessionProvider);
  }

  void initialization() async {
    SessionUser sessionUser = ref.read(sessionProvider);
    Navigator.pushNamedAndRemoveUntil(context, sessionUser.isLogin! ? ( 1 == 1 ? Move.boardHomePage : Move.boardHomePage) : Move.afterSplashPage, (route) => false);
    await Future.delayed(const Duration(seconds: 1));
    // FlutterNativeSplash.remove();
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
