import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/model/category/category.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_result_text_field.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:donut/views/components/donut_text_area.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:donut/views/pages/board/write_page/components/board_write_pay_field.dart';
import 'package:donut/views/pages/board/write_page/components/donut_category_dropdown.dart';
import 'package:flutter/material.dart';

class BoardWriteBodyForm extends StatefulWidget {
  BoardWriteBodyForm({Key? key}) : super(key: key);

  @override
  State<BoardWriteBodyForm> createState() => _BoardWriteBodyFormState();
}

class _BoardWriteBodyFormState extends State<BoardWriteBodyForm> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _countController = TextEditingController();
  final _myCountController = TextEditingController();
  final _contentController = TextEditingController();

  List<String> cate = categorys.map((e) => e.name).toList();
  var setDropdownItem = categorys[0].name;

  int onePrice = 0;
  int myPrice = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            DonutRoundTag("  같이 나눠사고 싶은 상품에 대해 적어주세요.  "),
            SizedBox(
              height: 20,
            ),

            //사진 등록
            DonutTextFormFieldSlim(
                title: "제목",
                funValidator: validateTitle(),
                controller: _titleController),
            SizedBox(
              height: 20,
            ),

            DonutCategoryDropdown(
              dropDownList: cate,
              dropDownitem: setDropdownItem,
            ),
            SizedBox(
              height: 20,
            ),

            DonutCountFormField(
                title: "총 금액",
                funValidator: validPrice(),
                controller: _priceController),
            Text(
              "참여자에겐 개당 예상 금액만 보여요!",
              style: caption1(mColor: donutColor2),
            ),
            SizedBox(
              height: 20,
            ),

            DonutCountFormField(
                title: "총 수량",
                funValidator: validateCount(),
                controller: _countController),
            //OnePrice 를 바뀌게 하고 싶음 위의 값이 바뀌면

            BoardWritePayField(funPay: (){
              setState(() {
                if (_priceController.text.isEmpty ||
                    _countController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("총 금액과 총 수량을 작성해주세요")));
                  onePrice = 0;
                }else {
                  onePrice = (int.parse(_priceController.text) /
                      int.parse(_countController.text))
                      .round();
                }
              });
            }, onePrice: onePrice),

            SizedBox(
              height: 20,
            ),

            DonutCountFormField(
                title: "본인이 구매할 수량",
                funValidator: validateCount(),
                controller: _myCountController),

            BoardWritePayField(funPay: (){
              setState(() {
                if (_myCountController.text.isEmpty || onePrice==0) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("개당 예상 금액과 구매할 수량을 체크해주세요")));
                  myPrice = 0;
                }else{
                myPrice = (onePrice * int.parse(_myCountController.text));}
              });
            }, onePrice: myPrice),
            SizedBox(
              height: 20,
            ),

            DonutTextArea(
                title: "상세 내용",
                hint: "같이 사고 싶은 상품의 정보와 그 외의 필요 정보를 알려주세요. (최소 10글자)",
                funValidator: validBoardContent(),
                controller: _contentController),
            SizedBox(
              height: 20,
            ),

            Container(
              width: getScreenWidth(context) * 0.9,
              child: DonutButton(
                  text: "장소와 시간 설정하기",
                  funPageRoute: () {
                    print("제목 : ${_titleController.text}");
                    print("카테고리 : ${setDropdownItem}");
                    print("총 금액 : ${_priceController.text}");
                    print("총 수량 : ${_countController.text}");
                    print("내가 구매할 수량 : ${_myCountController.text}");
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
