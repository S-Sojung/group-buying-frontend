import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  final textEditingController;
  final handleSubmitted;
  const ChatTextField({required this.textEditingController, required this.handleSubmitted, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:20.0),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Flexible(
            child: Container(
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints(
                minHeight: 40
              ),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: donutColor1
              ),
              child: TextField(
                minLines: 1,
                maxLines: 3,
                onSubmitted: (value) {
                  handleSubmitted(textEditingController.text);
                },
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: "메시지 보내기",
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 4.0),
            child: IconButton(
              icon: Icon(Icons.send,color: donutColorBasic),
              onPressed: () =>
                  handleSubmitted(textEditingController.text),
            ),
          ),
        ],
      ),
    );
  }
}
