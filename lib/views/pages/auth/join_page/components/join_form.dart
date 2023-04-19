import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:flutter/material.dart';

class JoinForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _nickname = TextEditingController();

  JoinForm({Key? key}) : super(key: key);

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
                    controller: _password,
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
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                    child: DonutButton(text: "회원 가입", funPageRoute: (){}),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: DonutButton(text: "네이버", funPageRoute: (){}),
          ),
        ],
      ),
    );
  }
}
