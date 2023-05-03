import 'package:donut/controller/user_controller.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
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
                    funValidator: validateEmail(),
                  ),
                  DonutTextFormField(
                    controller: _password,
                    title: "password",
                    hint: "password",
                    funValidator: validatePassword(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    child: DonutButton(text: "로그인", funPageRoute: () async {
                      if (_formKey.currentState!.validate()) {
                        //아래 read를 통해서 뭔가를 해야한다면 await 해서 기다려 줘야한다.
                        ref.read(userControllerProvider).login(_email.text.trim(), _password.text.trim());
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: DonutButton(text: "네이버로 로그인 하기", funPageRoute: (){

            }),
          ),
        ],
      ),
    );
  }
}
