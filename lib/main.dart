import 'package:donut/core/constants/move.dart';
import 'package:donut/views/pages/board/home_page/board_home_page.dart';
import 'package:donut/views/pages/board/write_page/board_write_second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();

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
      // initialRoute: sessionUser.isLogin! ? Move.postHomePage : Move.loginPage,
      routes: getRouters(),
      home: BoardHomePage(),
    );
  }
}
