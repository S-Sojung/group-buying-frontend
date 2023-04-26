import 'dart:async';
import 'dart:ffi';

import 'package:donut/core/constants/move.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/chatter_list/chatter_list.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/event/event.dart';
import 'package:donut/views/pages/board/detail_page/board_detail_page.dart';
import 'package:donut/views/pages/board/home_page/component/board_home_list_page.dart';
import 'package:donut/views/pages/board/map_page/board_map_page.dart';
import 'package:donut/views/pages/chat/list_page/chat_list_page.dart';
import 'package:donut/views/pages/user/detail_page/user_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BoardHomePage extends StatefulWidget {
  const BoardHomePage({Key? key}) : super(key: key);

  @override
  State<BoardHomePage> createState() => _BoardHomePageState();
}

class _BoardHomePageState extends State<BoardHomePage> {
  //상태변수
  final Completer<GoogleMapController> _mapController = Completer();
  bool isInitialized = false;
  bool isPermission = false;
  int _selectedIndex = 0;
  LatLng currentLatLng = LatLng(37.33500926, -122.03272188);
  List<Marker> _markers = [];

  @override
  void initState() {
    boards.forEach((element) {
      Marker mark = Marker(
        infoWindow: InfoWindow(title: "${boards[0].title}",
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BoardDetailPage(board: element)))),
        markerId: MarkerId(boards[0].id.toString()),
        position: LatLng(events[boards[0].eventId - 1].latitude,
            events[boards[0].eventId - 1].longitude),
      );
      _markers.add(mark);
    });
    _getCurrentLocation();
  }

  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Move.boardWritePage);
        },
        backgroundColor: donutColorBase,
        child: Icon(Icons.add, size: 50,),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        actionsIconTheme: IconThemeData(color: donutColorBase),
        title: Text("부전동"),
        titleTextStyle: TextStyle(
            fontSize: 17, fontWeight: FontWeight.bold, color: donutColorBase),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 30,)),
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications, size: 30,)),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex, //상태변수 세팅
        children: [
          BoardHomeListPage(), //스크록
          BoardMapPage(
            markers: _markers,
            mapController: _mapController,
            isInitialized: isInitialized,
            isPermission: isPermission,
            currentLatLng: currentLatLng,
          ),
          ChatListPage(chatterList: chatterLists[0]),// 스크롤
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
          currentIndex: _selectedIndex,
          //상태변수 매칭
          items: [
            // 얘는 IndexedStack에 들어가는 것들을 매칭해주면 됨 : icon은 required지만 label은 필수라고 적혀있지 않지만 필요함
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈"),
            BottomNavigationBarItem(icon: Icon(Icons.place), label: "위치"),
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "채팅"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "내정보"),
          ]
      ),
    );
  }

  //지도 현재 위치
  Future<void> _getCurrentLocation() async {
    await _determinePosition();
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: currentLatLng,
      zoom: 17,
    )));
  }

  //지도 권한
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('위치 서비스를 사용할 수 없습니다.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('위치 권한이 거부되었습니다');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('위치 권한이 영구적으로 거부되었습니다. 권한을 요청할 수 없습니다.');
    }
    setState(() {
      isPermission = true;
    });

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      currentLatLng = LatLng(position.latitude, position.longitude);
      isInitialized = true;
    });
  }
}
