import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/user/donutuser.dart';
import 'package:donut/model/user/user.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DonutChat extends ConsumerWidget {
  final message;
  final DoUser user;

  const DonutChat({required this.message, required this.user, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser sessionUser = ref.read(sessionProvider);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: user.id == sessionUser.user!.user.id
          ? donutMyChat(message: message)
          : donutUserChat(user: user,message: message),
    );
  }
}

class donutUserChat extends StatelessWidget {
  const donutUserChat({
    super.key,
    required this.user,
    required this.message,
  });

  final DoUser user;
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
              child: Image.asset("${user.profile}"),
              backgroundColor: Colors.transparent,
              // Text("${user.profile}", style: caption1(),),
            ),
            Text(
              "${user.nickname}",
              style: bodyText(),
            ),
          ],
        ),
        SizedBox(width: 15),
        Container(
          constraints: BoxConstraints(
            minHeight: 60,
            maxWidth: getScreenWidth(context) * 0.5,
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
        const Text("오전 8:21"),
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
        Text("오전 8:21"),
        Container(
          constraints: BoxConstraints(
            minHeight: 60,
            maxWidth: getScreenWidth(context) * 0.5,
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
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
