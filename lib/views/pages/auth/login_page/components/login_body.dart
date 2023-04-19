import 'package:donut/views/pages/auth/login_page/components/login_form.dart';
import 'package:donut/views/pages/auth/login_page/components/login_header.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            LoginHeader(),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}


