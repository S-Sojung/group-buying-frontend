import 'dart:async';

import 'package:donut/core/constants/move.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/category/category.dart';
import 'package:donut/model/category/mock_category.dart';
import 'package:donut/model/chatter_list/chatter_list.dart';
import 'package:donut/model/my_category/my_category.dart';
import 'package:donut/model/my_location/my_location.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/pages/board/detail_page/board_detail_page.dart';
import 'package:donut/views/pages/board/home_page/board_home_page_view_model.dart';
import 'package:donut/views/pages/board/home_page/component/board_home_list_page.dart';
import 'package:donut/views/pages/board/map_page/board_map_page.dart';
import 'package:donut/views/pages/chat/list_page/chat_list_page.dart';
import 'package:donut/views/pages/user/detail_page/user_detail_page.dart';
import 'package:donut/views/pages/user/hometown_page/user_set_hometown_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BoardHomePage extends ConsumerStatefulWidget {
  // BoardHomePageResponseDto BHPRdto;
  BoardHomePage({Key? key}) : super(key: key);

  @override
  BoardHomePageState createState() => BoardHomePageState();
}

class BoardHomePageState extends ConsumerState<BoardHomePage> {

  //상태변수
  final Completer<GoogleMapController> _mapController = Completer();
  bool isInitialized = false;
  bool isPermission = false;
  int _selectedIndex = 0;
  LatLng currentLatLng = LatLng(37.33500926, -122.03272188);
  List<Marker> _markers = [];
  List<Board> boardlist = [];
  List<Category> categories = [];
  Location mylocation = Location(town: "town");

  @override
  void initState () {
    super.initState();
    _getCurrentLocation();
    myCategorys.forEach((element) {
      print("${mockCategories[element.categoryId-1].name}");
      categories.add(Category(name: "${mockCategories[element.categoryId-1].name}"));
    });
  }

  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // boardlist = widget.BHPRdto.boards;
    // mylocation = widget.BHPRdto.myLocation;

    SessionUser sessionUser = ref.read(sessionProvider);
    BoardHomePageModel? model = ref.watch(boardHomePageProvider);
    if (model != null) {
      boardlist = model.BHPRdto.boards;
      // categories = model.BHPRdto.myCategories;
      mylocation = model.BHPRdto.myLocation!;
    }
    _markers = [];
    boardlist.forEach((element) {
      Marker mark = Marker(
        infoWindow: InfoWindow(
            title: "${element.title}",
            snippet: "${element.price}원 ${element.qty}개 ${element.paymentType}",
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BoardDetailPage(board: boardlist[0])))
        ),
        markerId: MarkerId(element.id.toString()),
        position: LatLng(element.latitude,
            element.longtitude),
      );
      _markers.add(mark);
    });

    return WillPopScope(
      onWillPop: ()async{
        await _onBackPressed(context);
        return false;
      },
      child: Scaffold(
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
          title: Text("${mylocation.town}"),
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
            BoardHomeListPage(categories: categories,boards: boardlist), //스크록
            BoardMapPage(
              markers: _markers,
              mapController: _mapController,
              isInitialized: isInitialized,
              isPermission: isPermission,
              currentLatLng: currentLatLng,
            ),
            ChatListPage(chatterList: chatterLists[0]),// 스크롤
            UserDetailPage(user: sessionUser.user!.user), // priciparid
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
  
  Future<void> _onBackPressed(BuildContext context) async{
    await showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("정말로 앱을 종료하시나요?"),
      actions: <Widget>[
        TextButton(onPressed: ()=>Navigator.pop(context), child: Text("아니요")),
        TextButton(onPressed: ()=>SystemNavigator.pop(), child: Text("네"))
      ],
    ),
    );
  }
}
