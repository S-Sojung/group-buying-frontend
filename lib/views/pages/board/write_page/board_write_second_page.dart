import 'dart:io';

import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/pages/board/write_page/components/board_write_second_body_form.dart';
import 'package:flutter/material.dart';

class BoardWriteSecondPage extends StatelessWidget {
  File? imgFile;
  String title;
  int category;
  int onePrice;
  int qty;
  List<String> tags;
  BoardWriteSecondPage({required this.imgFile, required this.title,required this.category, required this.onePrice, required this.qty,required this.tags, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        foregroundColor: donutColorBase,
      ),
      body: BoardDonutWriteSecondBodyForm(imgFile: imgFile,title: title,category: category,onePrice: onePrice,qty: qty ,tags: tags),
    );
  }
}
