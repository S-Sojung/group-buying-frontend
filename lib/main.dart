import 'package:donut/core/constants/style.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_label_round_textbox.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'HallymGothic',
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          DonutTextFormField(title: "email", hint: "email", funValidator: validateTitle()),
          DonutButton(text: "버튼", funPageRoute: () {

            }),
          Row(
            children: [
              DonutRoundTag("comment"),
              DonutRoundTag("comment",code: "1",)],
          ),
          DonutLabelRoundTextbox()
        ],
      )
    );
  }
}
