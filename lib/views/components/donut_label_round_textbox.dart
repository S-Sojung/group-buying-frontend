import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:flutter/material.dart';

class DonutLabelRoundTextbox extends StatelessWidget {
  final String title;
  final String content;
  const DonutLabelRoundTextbox({required this.title, required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: getScreenWidth(context)*0.9,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Align(alignment:Alignment(-0.9, 0),child: Text("${title}",style: subHead(),)),
          Text("${content}",style: bodyText(),),
        ],
      ),
    );
  }
}
