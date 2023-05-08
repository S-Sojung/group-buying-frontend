import 'package:donut/controller/account_controller.dart';
import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/model/my_account/my_account.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:donut/views/pages/user/account_page/user_account_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_button/group_button.dart';

class UserSetAccountBody extends ConsumerStatefulWidget {

  UserSetAccountBody({Key? key}) : super(key: key);

  @override
  _UserSetAccountBodyState createState() => _UserSetAccountBodyState();
}



class _UserSetAccountBodyState extends ConsumerState<UserSetAccountBody> {
  final _formKey = GlobalKey<FormState>();

  final _myAccountController = TextEditingController();
  String Account = "";

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Form(
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
                  Align(alignment: Alignment.centerLeft ,child: Text("계좌번호  \n 확인 절차가 따로 없으니 잘 작성해 주세요! ",)),
                  DonutAccountFormFieldSlim(
                    readOnly: false,
                      funValidator: validateAccount(),
                      controller: _myAccountController),
                ],
              ),

              DonutButton(text: "계좌 설정 완료", funPageRoute: (){
                if(Account!= null && _myAccountController.text != null){
                  UserAccountPageModel? model = ref.watch(userAccountPageProvider);
                  MyAccount? myAccount ;
                  if (model != null) {
                    ref.read(accountControllerProvider).updateAccount(Account, _myAccountController.text);
                  }else{
                    ref.read(accountControllerProvider).saveAccount(Account, _myAccountController.text);
                  }
                }else if(Account == null){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("계좌를 선택해 주세요")));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("계좌번호를 작성해 주세요")));
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
