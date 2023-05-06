import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/rate/rate.dart';
import 'package:flutter/material.dart';

class DonutRateBar extends StatelessWidget {
  final Rate rate;
  final ratePoint;
  const DonutRateBar(this.rate, {required this.ratePoint, Key? key}) : super(key: key);

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
                width: getScreenWidth(context)*0.9*((ratePoint?? 10)!*0.01),
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

class DonutMinRateBar extends StatelessWidget {
  final MocRate rate;
  const DonutMinRateBar(this.rate, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context)*0.9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                width: getScreenWidth(context)*0.9*(rate.ratePoint!*0.002),
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
          Align(alignment: Alignment.centerLeft,child: Text("${rate.rateName}",style: caption1(),)),
        ],
      ),
    );
  }
}
