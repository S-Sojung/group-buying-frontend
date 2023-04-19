import 'package:donut/core/constants/size.dart';
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
      child: Text("$text"),
    );
  }
}
