import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';

class DonutTextTitleAndContent extends StatelessWidget {
  final String title;
  final String content;
  const DonutTextTitleAndContent({required this.title, required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: getScreenWidth(context) * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${title}",
              style: callout(),
            ),
            Text(
              "${content}",
              style: caption1(mColor: donutColor2),
            ),
          ],
        )
    );
  }
}
