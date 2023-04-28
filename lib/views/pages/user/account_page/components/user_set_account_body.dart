import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class UserSetAccountBody extends StatefulWidget {

  UserSetAccountBody({Key? key}) : super(key: key);

  @override
  State<UserSetAccountBody> createState() => _UserSetAccountBodyState();
}



class _UserSetAccountBodyState extends State<UserSetAccountBody> {
  final _formKey = GlobalKey<FormState>();

  final _myAccountController = TextEditingController();
  String Account = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 50,horizontal: getScreenWidth(context)*0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                GroupButton(
                  options: GroupButtonOptions(
                      borderRadius: BorderRadius.circular(10),
                      selectedColor: donutColorBasic
                  ),
                  isRadio: true,
                  onSelected: (value, index, isSelected) { Account = value;},
                  buttons: ["경남","광주","국민","기업","농협","대구","부산","새마을","수협","신한","신협","우리","우체국","저축은행","전북","제주","하나","한국씨티","카카오뱅크","토스뱅크",],
                ),
                SizedBox(
                  height: 20,
                ),
                DonutTextFormFieldSlim(
                    title: "계좌 번호",
                    funValidator: validateAccount(),
                    controller: _myAccountController),
              ],
            ),
            DonutButton(text: "계좌 설정 완료", funPageRoute: (){

            })
          ],
        ),
      ),
    );
  }
}
