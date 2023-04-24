import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/pages/board/write_page/components/board_write_second_body_form.dart';
import 'package:flutter/material.dart';

class BoardWriteSecondPage extends StatelessWidget {
  const BoardWriteSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        foregroundColor: donutColorBase,
      ),
      body: BoardDonutWriteSecondBodyForm(),
    );
  }
}
