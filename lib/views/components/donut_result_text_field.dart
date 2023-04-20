import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';

class DonutResultTextField extends StatelessWidget {
  final String title;
  final int price;

  const DonutResultTextField({
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(context) * 0.05, vertical: 5),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: donutColorBasic),
            color: donutColor1
        ),
        child: Row(children: [
          Text(
            " ${title}",
            style: callout(),
          ),
          Spacer(),
          Text(
            " ${price} 원 ",
            style: callout(),
          ),
        ]),
      ),
    );
  }
}
