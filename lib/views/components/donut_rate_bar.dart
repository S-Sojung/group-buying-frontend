import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/rate/rate.dart';
import 'package:flutter/material.dart';

class DonutRateBar extends StatelessWidget {
  final Rate rate;
  const DonutRateBar(this.rate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context)*0.9,
      child: Column(
        children: [
          Align(alignment: Alignment.centerLeft,child: Text("${rate.rateName}")),
          Stack(
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: donutColorBase
                ),
              ),
              Container(
                width: getScreenWidth(context)*0.9*(rate.ratePoint!*0.01),
                height: 5,
                margin: EdgeInsets.all(2.5),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: donutColor1
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
