import 'dart:io';

import 'package:donut/core/constants/size.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/donut_login.png", width: getScreenWidth(context)*0.5,height: getScreenWidth(context)*0.5);
  }
}
