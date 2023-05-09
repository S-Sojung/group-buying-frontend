import 'package:donut/core/constants/size.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:flutter/material.dart';

class DonutTagButton extends StatelessWidget {
  final tagController;
  final funAdd;
  const DonutTagButton({required this.tagController, required this.funAdd, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: getScreenWidth(context)*0.6,
            child: DonutTextFormFieldSlim(
                title: "해시태그 입력하기", funValidator: validateTag(),controller: tagController),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5, right:getScreenWidth(context)*0.05 ),
            child: Container(
              height: 40,
              width: getScreenWidth(context)*0.3 ,
              child: DonutButton(text: "입력", funPageRoute: funAdd),
            ),
          )
        ],
      ),
    );
  }
}
