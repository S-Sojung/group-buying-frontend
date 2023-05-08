import 'package:donut/core/constants/size.dart';
import 'package:flutter/material.dart';

class JoinHeader extends StatelessWidget {
  const JoinHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/donut_join.png", width: getScreenWidth(context)*0.5,height: getScreenWidth(context)*0.5);
  }
}
