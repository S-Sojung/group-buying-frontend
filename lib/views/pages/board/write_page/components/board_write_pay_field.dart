
import 'package:donut/core/constants/size.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_result_text_field.dart';
import 'package:flutter/material.dart';

class BoardWritePayField extends StatelessWidget {
  final onePrice;
  final funPay;
  const BoardWritePayField({required this.funPay, required this.onePrice, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return             Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05),
      child: Row(
        children: [
          Expanded(child: DonutResultTextField(title: "", price: onePrice)),
          Container(
            width: getScreenWidth(context)*0.4,
            height: 40,
            child: DonutButton(
                text: "1개당 예상 금액",
                funPageRoute: funPay),
          ),
        ],
      ),
    );
  }
}
