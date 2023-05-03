import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:donut/core/constants/move.dart';
import 'package:donut/model/user/user_repository.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/pages/board/home_page/board_home_page.dart';
import 'package:donut/views/pages/splash/after_splash_page/after_splash_page.dart';
import 'package:donut/views/pages/splash/splash_page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SessionUser sessionUser = await UserRepository().fetchJwtVerify();

  runApp(
    ProviderScope(
      overrides: [sessionProvider.overrideWithValue(sessionUser)],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser sessionUser = ref.read(sessionProvider);

    return MaterialApp(
      title: "donut market",
      theme: ThemeData(
        fontFamily: 'HallymGothic',
      ),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      // 로그인 상태일 경우, 내 위치 가 설정되어 있지 않다면? 내 위치 설정으로 가기
      // Navigator.pushNamedAndRemoveUntil(context, sessionUser.isLogin! ? ( 1 == 1 ? Move.boardHomePage : Move.boardHomePage) : Move.afterSplashPage, (route) => false);
      routes: getRouters(),
      home: AnimatedSplashScreen(
          splash: Lottie.network("https://assets4.lottiefiles.com/packages/lf20_pjdN0Y.json"),
          animationDuration: const Duration(seconds: 5),
          nextScreen: sessionUser.isLogin!
              ? (1 == 1 ? BoardHomePage() : BoardHomePage())
              : AfterSplashPage(),
      ),
    );
  }
}
