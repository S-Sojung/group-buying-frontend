import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';

class DonutButton extends StatelessWidget {
  final String text;
  final funPageRoute;

  const DonutButton({required this.text, required this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: donutColorBasic,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: funPageRoute,
      child: Text(
        "$text",
        style: bodyText(mColor: Colors.white),
      ),
    );
  }
}

class DonutRoundButton extends StatelessWidget {
  final String text;
  final funPageRoute;

  const DonutRoundButton({required this.text, required this.funPageRoute});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: donutColor2,
        minimumSize: Size(100, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: funPageRoute,
      child: Text(
        "$text",
        style: bodyText(mColor:donutColorBase),
      ),
    );
  }
}
