
import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/pages/board/write_page/components/board_write_body_form.dart';
import 'package:flutter/material.dart';

class BoardWritePage extends StatelessWidget {
  const BoardWritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        actionsIconTheme: IconThemeData(color: donutColorBase),
      ),
      body: BoardWriteBodyForm(),
    );
  }
}
