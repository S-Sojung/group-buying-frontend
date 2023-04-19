import 'package:donut/core/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center,
      children: [
      SvgPicture.asset("assets/images/donut.svg", height: 150, width: 150,),
        Text(
        "로그인",
        style: donutTitle(),
      ),
    ],
    );
  }
}
