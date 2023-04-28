import 'package:donut/core/constants/move.dart';
import 'package:donut/views/pages/board/home_page/board_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  // SessionUser sessionUser = await UserRepository().fetchJwtVerify();
  // runApp(
  //   ProviderScope(
  //     overrides: [
  //       sessionProvider.overrideWithValue(sessionUser)
  //     ],
  //     child: MyApp(),
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //SessionUser sessionUser = ref.read(sessionProvider);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'HallymGothic',
      ),
      debugShowCheckedModeBanner: false,
      // 로그인 상태일 경우, 내 위치 가 설정되어 있지 않다면? 내 위치 설정으로 가기
      // initialRoute: sessionUser.isLogin! ? ( 1 == 1 ? Move.boardHomePage : Move.boardHomePage) : Move.loginPage,
      routes: getRouters(),
      home: BoardHomePage(),
    );
  }
}
