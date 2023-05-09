import 'package:donut/model/rate/rate.dart';
import 'package:donut/model/user/donutuser.dart';
import 'package:donut/model/user/user.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:donut/views/pages/chat/room_page/components/donut_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatList extends ConsumerWidget {
  List<String> messages;
  final DonutUser user;
  ChatList({required this.messages, required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SessionUser sessionUser = ref.read(sessionProvider);
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        reverse: true,
        itemCount: messages.length +1,
        itemBuilder: (BuildContext context, int index ) {
          // 유저가 현재 로그인한 내정보인지
          if(index == messages.length){
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: DonutRoundTag("유저1,유저2 님과의 대화입니다."),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: DonutRoundTag("도넛 마켓은 당사자간의 거래에는 개입하지 않으며 페이 사용 시 거래 확정 후 개설자에게 돈이 지급 됩니다.",code: "1"),
                ),
                DonutChat(message: "안녕하세요 오늘 아침 9시 서면역 1번 출구 괜찮나요?", user: DoUser(id: 2, username: "ssar@naver.com",nickname: "ssar", email: "ssar@naver.com", rate: Rate(id: 1, rateName: "글레이즈드", createdAt: DateTime.now()),ratePoint: 10,profile: "assets/images/donut.png", createdAt: DateTime.now()))
              ],
            );
          }
          return DonutChat(message:messages[index], user: sessionUser.user!.user);
        },
      ),
    );
  }
}
