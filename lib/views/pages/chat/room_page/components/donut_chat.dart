import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/user/donutuser.dart';
import 'package:flutter/material.dart';

class DonutChat extends StatelessWidget {
  final message;
  final DonutUser user;
  const DonutChat({required this.message, required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child:donutMyChat(message: message),
    );
  }

}

class donutUserChat extends StatelessWidget {
  const donutUserChat({
    super.key,
    required this.user,
    required this.message,
  });

  final DonutUser user;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Text("${user.profile}",style: caption1(),),
            ),
            Text("${user.name}",
              style: bodyText(),
            ),
          ],
        ),
        SizedBox(width: 15),
        Container(
          constraints: BoxConstraints(
            minHeight: 60,
            maxWidth: getScreenWidth(context)*0.5,
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: donutGray100,
          ),
          child: Text(
            message,
            style: bodyText(),
          ),
        ),
        const Text("10시10분"),
      ],
    );
  }
}

class donutMyChat extends StatelessWidget {
  const donutMyChat({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text("10시10분"),
        Container(
          constraints: BoxConstraints(
            minHeight: 60,
            maxWidth: getScreenWidth(context)*0.5,
          ),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: donutColor1,
          ),
          child: Text(
            message,
            style: bodyText(),
          ),
        ),
        const SizedBox(width: 10,)
      ],
    );
  }
}
