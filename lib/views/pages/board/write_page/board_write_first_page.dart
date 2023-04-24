
import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/pages/board/write_page/components/board_write_first_body_form.dart';
import 'package:flutter/material.dart';

class BoardWriteFirstPage extends StatelessWidget {
  const BoardWriteFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          foregroundColor: donutColorBase,
        ),
      body: BoardWriteFirstBodyForm(),
    );
  }
}
