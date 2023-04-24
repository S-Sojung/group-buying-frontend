import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';

class DonutTextArea extends StatelessWidget {
  final String title;
  final String hint;
  final funValidator;
  final controller;

  const DonutTextArea(
      {required this.title, required this.hint, required this.funValidator, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${title}",style: callout(),),
          TextFormField(
            controller: controller,
            maxLines: 10,
            validator: funValidator,
            decoration: InputDecoration(
              hintText: "$hint",
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: donutColorBasic),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: donutColorBasic),
                borderRadius: BorderRadius.circular(5),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: donutColorBasic),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: donutColorBasic),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
