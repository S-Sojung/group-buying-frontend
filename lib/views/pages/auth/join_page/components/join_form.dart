import 'package:donut/controller/user_controller.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JoinForm extends ConsumerStatefulWidget {

  JoinForm({Key? key}) : super(key: key);

  @override
  _JoinFormState createState() => _JoinFormState();
}

class _JoinFormState extends ConsumerState<JoinForm> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _passwordCheck = TextEditingController();
  final _nickname = TextEditingController();

  bool isLogin = false;
  String? email;
  String? name;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                border: Border.all(color: donutColorBasic),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  DonutTextFormField(
                    controller: _email,
                    title: "email",
                    hint: "email",
                    funValidator: validateUsername(),
                  ),
                  DonutTextFormField(
                    controller: _password,
                    title: "password",
                    hint: "password",
                    funValidator: validatePassword(),
                  ),
                  DonutTextFormField(
                    controller: _passwordCheck,
                    title: "pwcheck",
                    hint: "password",
                    funValidator: validatePassword(),
                  ),
                  DonutTextFormField(
                    controller: _nickname,
                    title: "nickname",
                    hint: "nickname",
                    funValidator: validateNikename(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: DonutButton(text: "회원 가입", funPageRoute: (){
                      if(_password.text.trim() != _passwordCheck.text.trim()){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("비밀번호가 다릅니다.")));
                      }else{
                      ref.read(userControllerProvider).join(_email.text.trim(), _password.text.trim(), _nickname.text.trim(),);
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          InkWell(
              onTap: buttonLoginPressed,
              child: Image.asset("assets/images/btnG_완성형.png",height: 50,)
          )
        ],
      ),
    );
  }

  Future<void> buttonLoginPressed() async {
    try {
      final NaverLoginResult res = await FlutterNaverLogin.logIn();
      setState(() {
        email = res.account.email;
        name = res.account.nickname;
        isLogin = true;
        print("email : ${email}");
        print("email : ${name}");
        print("accessToken : ${res.accessToken}");
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("오류 : ${error.toString()}")));
    }
  }
}
