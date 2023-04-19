import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';

class DonutTextFormField extends StatelessWidget {
  final String title;
  final String hint;
  final funValidator;
  final controller;

  const DonutTextFormField({
    required this.title,
    required this.hint,
    required this.funValidator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05,vertical: 5),
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Text("${title}",style: subHead(),),
          TextFormField(
            controller: controller,
            validator: funValidator,

            obscureText: hint == "Password" ? true : false,
            decoration: InputDecoration(
              hintText: "Enter $hint",
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: donutColorBase),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: donutColorBase),
                borderRadius: BorderRadius.circular(20),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: donutColorBase),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: donutColorBase),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
