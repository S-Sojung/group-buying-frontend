import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:flutter/material.dart';


//사용 X
class DonutCountField extends StatelessWidget {
  int count;
  final String title;
  final addFunc;
  final minusFunc;
  final controller;

  DonutCountField(
      {required this.title,
      required this.count,
      required this.addFunc,
      required this.minusFunc,
      this.controller,
      Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(context) * 0.05, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DonutCountFormField(
            title: title,
            funValidator: validateCount(),
            controller: controller,
          ),


          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: donutColorBasic)),
            child: IconButton(
                onPressed: count <= 0 ? null : minusFunc,
                icon: Icon(
                  Icons.remove,
                  size: 22,
                ),
                color: donutColorBasic,
                disabledColor: donutGray200),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: donutColorBasic)),
            child: IconButton(
                onPressed: addFunc,
                icon: Icon(
                  Icons.add,
                  size: 22,
                  color: donutColorBasic,
                )),
          ),
        ],
      ),
    );
  }
}
