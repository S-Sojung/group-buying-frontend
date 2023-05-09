import 'package:donut/controller/location_controller.dart';
import 'package:donut/controller/user_controller.dart';
import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/model/my_location/mock_my_location.dart';
import 'package:donut/model/my_location/my_location.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:donut/views/pages/board/home_page/board_home_page_view_model.dart';
import 'package:donut/views/pages/user/hometown_page/user_hometown_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class UserSetHometownPage extends ConsumerStatefulWidget {
  const UserSetHometownPage({Key? key}) : super(key: key);

  @override
  _UserSetHometownPageState createState() => _UserSetHometownPageState();
}

class _UserSetHometownPageState extends ConsumerState<UserSetHometownPage> {
  TextEditingController _AddressController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    UserHomeTownPageModel? model = ref.watch(userHomeTownPageProvider);
    MyLocation? myLocation ;
    if (model != null) {
      myLocation = model.myLocation;
      _AddressController.text="${myLocation!.state} ${myLocation.city} ${myLocation.town}";
    }else{
      ref.read(locationControllerProvider).defaultLocation();
    }

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          foregroundColor: donutColorBasic,
          title: Text("내 동네 설정"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  size: 30,
                )),
          ]),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05,vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('집 주소를 입력하면 \n읍, 면, 동 까지의 정보가 저장됩니다!', style: bodyText()),
            SizedBox(height: 20,),
            AddressText(),
            SizedBox(height: 20,),
            DonutButton(text: "설정 완료", funPageRoute: (){
              List<String> myLocas = _AddressController.text.split(" ");
              ref.read(locationControllerProvider).updateLocation(myLocas[0], myLocas[1], myLocas[2]);

            })
          ],
        ),
      ),
    );
  }

  Widget AddressText() {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        _addressAPI(); // 카카오 주소 API
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('여기를 클릭하면 주소를 설정할 수 있습니다. ', style: callout(mColor: donutColorBasic)),
            TextFormField(
              enabled: false,
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: donutColorBasic),
                  borderRadius: BorderRadius.circular(20),
                ),

                isDense: false,
              ),
              controller: _AddressController,
              style: bodyText(),
            ),
          ],
        ),
      ),
    );
  }

  _addressAPI() async {
    KopoModel model = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RemediKopo(),)
    );
    _AddressController.text =
    '${model.sido} ${model.sigungu} ${model.bname}';

    // print("테스트 ${model.sido}"); // state
    // print("테스트 ${model.sigungu}"); // city
    // print("테스트 ${model.bname}"); //town
    //${model.zonecode!} // 우편번호
  }
}