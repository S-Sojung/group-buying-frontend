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
import 'package:donut/views/pages/board/write_page/components/donut_category_dropdown.dart';
import 'package:donut/views/pages/board/write_page/components/donut_count_field.dart';
import 'package:flutter/material.dart';

class BoardWritePage extends StatefulWidget {
  const BoardWritePage({Key? key}) : super(key: key);

  @override
  State<BoardWritePage> createState() => _BoardWritePageState();
}

class _BoardWritePageState extends State<BoardWritePage> {
  final _priceController = TextEditingController();
  final _countController = TextEditingController();
  final _myCountController = TextEditingController();

  List<String> cate = categorys.map((e) => e.name).toList();
  String selected = categorys[0].name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        actionsIconTheme: IconThemeData(color: donutColorBase),
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(height: 20,),
            DonutRoundTag("  같이 나눠사고 싶은 상품에 대해 적어주세요.  "),
            SizedBox(height: 20,),

            //사진 등록
            DonutTextFormFieldSlim(
                title: "제목", funValidator: validateTitle()),
            SizedBox(height: 20,),


            DonutCategoryDropdown(dropDownList: cate,dropDownitem: selected),
            SizedBox(height: 20,),

            DonutCountFormField(
                title: "총 금액",
                funValidator: validPrice(),
                controller: _priceController),
            Text(
              "참여자에겐 개당 예상 금액만 보여요!",
              style: caption1(mColor: donutColor2),
            ),
            SizedBox(height: 20,),
            DonutCountFormField(
                title: "총 수량",
                funValidator: validateCount(),
                controller: _countController),
            DonutResultTextField(title: "1개당 예상 금액", price: 900),
            SizedBox(height: 20,),
            DonutCountFormField(
                title: "본인이 구매할 수량",
                funValidator: validateCount(),
                controller: _myCountController),
            DonutResultTextField(
              title: "본인이 낼 금액",
              price: 1800,
            ),
            SizedBox(height: 20,),
            DonutTextArea(
              title: "상세 내용",
                hint: "같이 사고 싶은 상품의 정보와 그 외의 필요 정보를 알려주세요. (최소 10글자)",
                funValidator: validBoardContent()),
            SizedBox(height: 20,),
            Container(width: getScreenWidth(context)*0.9,child: DonutButton(text: "장소와 시간 설정하기", funPageRoute: (){}))
          ],
        ),
      ),
    );
  }
}
