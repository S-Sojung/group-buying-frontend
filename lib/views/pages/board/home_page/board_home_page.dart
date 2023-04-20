import 'dart:ffi';

import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/pages/board/home_page/component/board_home_list_page.dart';
import 'package:donut/views/pages/board/map_page/board_map_page.dart';
import 'package:donut/views/pages/chat/room_page/chat_room_page.dart';
import 'package:donut/views/pages/user/detail_page/user_detail_page.dart';
import 'package:flutter/material.dart';

class BoardHomePage extends StatefulWidget {
  const BoardHomePage({Key? key}) : super(key: key);

  @override
  State<BoardHomePage> createState() => _BoardHomePageState();
}

class _BoardHomePageState extends State<BoardHomePage> {
  //상태변수
  int _selectedIndex = 0;

  void changeScreen(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: donutColorBase,
        child: Icon(Icons.add,size: 50,),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actionsIconTheme: IconThemeData(color: donutColorBase),
        title: Text("부전동"),
        titleTextStyle:TextStyle(fontSize: 17, fontWeight: FontWeight.bold,color: donutColorBase),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,size: 30,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notifications,size: 30,)),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex, //상태변수 세팅
        children: [
          BoardHomeListPage(), //스크록
          BoardMapPage(),
          ChatRoomPage(), // 스크롤
          UserDetailPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.grey[100],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black54,
          onTap: (index) { //상태변수 변경
            changeScreen(index);
          },
          currentIndex: _selectedIndex,//상태변수 매칭
          items: [
            // 얘는 IndexedStack에 들어가는 것들을 매칭해주면 됨 : icon은 required지만 label은 필수라고 적혀있지 않지만 필요함
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "홈"),
            BottomNavigationBarItem(icon: Icon(Icons.place),label: "위치"),
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble),label: "채팅"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "내정보"),
          ]
      ),
    );
  }
}
