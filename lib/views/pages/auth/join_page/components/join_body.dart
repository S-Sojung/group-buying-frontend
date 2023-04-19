import 'package:donut/views/pages/auth/join_page/components/join_form.dart';
import 'package:donut/views/pages/auth/join_page/components/join_header.dart';
import 'package:flutter/material.dart';

class JoinBody extends StatelessWidget {
  JoinBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            JoinHeader(),
            JoinForm(),
          ],
        ),
      ),
    );
  }
}


