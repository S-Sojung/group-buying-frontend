

import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:donut/views/pages/board/write_page/components/donut_map.dart';
import 'package:flutter/material.dart';

class BoardWriteBody2Form extends StatefulWidget {
  BoardWriteBody2Form({Key? key}) : super(key: key);

  @override
  State<BoardWriteBody2Form> createState() => _BoardWriteBodyForm2State();
}

class _BoardWriteBodyForm2State extends State<BoardWriteBody2Form> {
  final _placeController = TextEditingController();
  final _timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            DonutTextFormFieldSlim(title: "거래 희망 장소", funValidator: validateTitle(),controller: _placeController,),
            Container(
              width: getScreenWidth(context)*0.9,
              height: getScreenWidth(context)*0.9,
              color: donutColorBase,
              child: DonutMap(),
            ),
          ],
        ),
      ),
    );
  }
}
