import 'package:bootpay/bootpay.dart';
import 'package:bootpay/config/bootpay_config.dart';
import 'package:bootpay/model/extra.dart';
import 'package:bootpay/model/item.dart';
import 'package:bootpay/model/payload.dart';
import 'package:bootpay/model/stat_item.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/user/user.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:donut/views/pages/chat/room_page/components/chat_list.dart';
import 'package:donut/views/pages/chat/room_page/components/chat_room_header.dart';
import 'package:donut/views/pages/chat/room_page/components/chat_text_field.dart';
import 'package:donut/views/pages/chat/room_page/components/donut_chat.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bootpay/model/user.dart';

class ChatRoomPage extends StatefulWidget {

  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  //----채팅---
  List<String> _messages = [];
  TextEditingController _textEditingController = TextEditingController();
  void _handleSubmitted(String text) {
    _textEditingController.clear();
    String message = text;
    setState(() {
      _messages.insert(0, message);
    });
  }

  //-----결제---
  Payload payload = Payload();

  String webApplicationId = '6441fb21755e27001be57d8f';
  String androidApplicationId = '6441fb21755e27001be57d90';
  String iosApplicationId = '6441fb21755e27001be57d91';

  String get applicationId {
    return Bootpay().applicationId(
        webApplicationId,
        androidApplicationId,
        iosApplicationId
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bootpayAnalyticsUserTrace(); //통계용 함수 호출
    bootpayAnalyticsPageTrace(); //통계용 함수 호출
    bootpayReqeustDataInit();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        foregroundColor: donutColorBasic,
        title: Text("채팅"),
      ),
      body: Container(
        child: Column(
          children: [
            ChatRoomHeader(
              paymentFunc: () => goBootpayTest(context),
            ),
            ChatList(messages: _messages, user: users[0]), // 채팅 리스트
            Divider(
              height: 1.0,
            ),
            ChatTextField(textEditingController: _textEditingController, handleSubmitted: _handleSubmitted)
          ],
        ),
      ),
    );
  }


  User generateUser() {
    var user = User();
    user.id = '123411aaaaaaaaaaaabd4ss11';
    user.gender = 1;
    user.email = 'test1234@gmail.com';
    user.phone = '01012345678';
    user.birth = '19880610';
    user.username = '홍길동';
    user.area = '서울';
    return user;
  }


  //통계용 함수
  bootpayAnalyticsUserTrace() async {

    await Bootpay().userTrace(
        id: 'user_1234',
        email: 'user1234@gmail.com',
        gender: -1,
        birth: '19941014',
        area: '서울',
        applicationId: applicationId
    );
  }

  //통계용 함수
  bootpayAnalyticsPageTrace() async {

    StatItem item1 = StatItem();
    item1.itemName = "미키 마우스"; // 주문정보에 담길 상품명
    item1.unique = "ITEM_CODE_MOUSE"; // 해당 상품의 고유 키
    item1.price = 500; // 상품의 가격
    item1.cat1 = '컴퓨터';
    item1.cat2 = '주변기기';

    StatItem item2 = StatItem();
    item2.itemName = "키보드"; // 주문정보에 담길 상품명
    item2.unique = "ITEM_CODE_KEYBOARD"; // 해당 상품의 고유 키
    item2.price = 500; // 상품의 가격
    item2.cat1 = '컴퓨터';
    item2.cat2 = '주변기기';

    List<StatItem> items = [item1, item2];

    await Bootpay().pageTrace(
        url: 'main_1234',
        pageType: 'sub_page_1234',
        applicationId: applicationId,
        userId: 'user_1234',
        items: items
    );
  }

  //결제용 데이터 init
  bootpayReqeustDataInit() {
    Item item1 = Item();
    item1.name = "미키 '마우스"; // 주문정보에 담길 상품명
    item1.qty = 1; // 해당 상품의 주문 수량
    item1.id = "ITEM_CODE_MOUSE"; // 해당 상품의 고유 키
    item1.price = 500; // 상품의 가격

    Item item2 = Item();
    item2.name = "키보드"; // 주문정보에 담길 상품명
    item2.qty = 1; // 해당 상품의 주문 수량
    item2.id = "ITEM_CODE_KEYBOARD"; // 해당 상품의 고유 키
    item2.price = 500; // 상품의 가격
    List<Item> itemList = [item1, item2];

    payload.webApplicationId = webApplicationId; // web application id
    payload.androidApplicationId = androidApplicationId; // android application id
    payload.iosApplicationId = iosApplicationId; // ios application id


    payload.pg = '나이스페이';
    payload.method = '네이버페이';
    // payload.methods = ['카드', '휴대폰', '가상계좌', '계좌이체', '카카오페이'];
    payload.orderName = "테스트 상품"; //결제할 상품명
    payload.price = 1000.0; //정기결제시 0 혹은 주석


    payload.orderId = DateTime.now().millisecondsSinceEpoch.toString(); //주문번호, 개발사에서 고유값으로 지정해야함


    payload.metadata = {
      "callbackParam1" : "value12",
      "callbackParam2" : "value34",
      "callbackParam3" : "value56",
      "callbackParam4" : "value78",
    }; // 전달할 파라미터, 결제 후 되돌려 주는 값
    payload.items = itemList; // 상품정보 배열

    User user = User(); // 구매자 정보
    user.username = "사용자 이름";
    user.email = "user1234@gmail.com";
    user.area = "서울";
    // user.phone = "010-0000-0000";
    user.addr = 'null';

    Extra extra = Extra(); // 결제 옵션
    extra.appScheme = 'bootpayFlutterExample';

    if(BootpayConfig.ENV == -1) {
      payload.extra?.redirectUrl = 'https://dev-api.bootpay.co.kr/v2';
    } else if(BootpayConfig.ENV == -2) {
      payload.extra?.redirectUrl = 'https://stage-api.bootpay.co.kr/v2';
    }  else {
      payload.extra?.redirectUrl = 'https://api.bootpay.co.kr/v2';
    }

    // extra.cardQuota = '3';
    // extra.openType = 'popup';

    // extra.carrier = "SKT,KT,LGT"; //본인인증 시 고정할 통신사명
    // extra.ageLimit = 20; // 본인인증시 제한할 최소 나이 ex) 20 -> 20살 이상만 인증이 가능

    payload.user = user;
    payload.items = itemList;
    payload.extra = extra;
    // payload.extra?.openType = "iframe";
  }


  //버튼클릭시 부트페이 결제요청 실행
  void goBootpayTest(BuildContext context) {
    if(kIsWeb) {
      //flutter web은 cors 이슈를 설정으로 먼저 해결해주어야 한다.
      payload.extra?.openType = 'iframe';
    }
    // print('popup');
    // payload.extra?.openType = 'popup';

    payload.pg = '나이스페이';
    payload.method = "카드";

    Bootpay().requestPayment(
      context: context,
      payload: payload,
      showCloseButton: false,
      // closeButton: Icon(Icons.close, size: 35.0, color: Colors.black54),
      onCancel: (String data) {
        print('------- onCancel 1 : $data');
      },
      onError: (String data) {
        print('------- onError: $data');
      },
      onClose: () {
        print('------- onClose');
        Bootpay().dismiss(context); //명시적으로 부트페이 뷰 종료 호출
        //TODO - 원하시는 라우터로 페이지 이동
      },
      onIssued: (String data) {
        print('------- onIssued: $data');
      },
      onConfirm: (String data)  {

        // checkQtyFromServer(data, context).then((value) => print(1243));
        // await check

        print('------- onConfirm: $data');

        // checkQtyFromServer(data);
        return true;
      },
      onDone: (String data) {
        print('------- onDone: $data');
      },
    );
  }

}



