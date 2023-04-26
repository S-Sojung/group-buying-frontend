import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/user/user.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:donut/views/pages/chat/room_page/components/chat_room_header.dart';
import 'package:donut/views/pages/chat/room_page/components/donut_chat.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget {

  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  State<ChatRoomPage> createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {
  List<String> _messages = [];
  TextEditingController _textEditingController = TextEditingController();
  void _handleSubmitted(String text) {
    _textEditingController.clear();
    String message = text;
    setState(() {
      _messages.insert(0, message);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        foregroundColor: donutColorBasic,
        title: Text("채팅"),
      ),
      body: Container(
        child: Column(
          children: [
            ChatRoomHeader(),
            _buildChatList(), // 채팅 리스트
            Divider(
              height: 1.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor),
              child: _buildChatInput(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatList() {
    return Flexible(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        reverse: true,
        itemCount: _messages.length +1,
        itemBuilder: (BuildContext context, int index ) {
          // 유저가 현재 로그인한 내정보인지
          if(index == _messages.length){
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
              ],
            );
          }
          return DonutChat(message:_messages[index], user: users[0]);
        },
      ),
    );
  }

  Widget _buildChatInput() {
    return IconTheme(
      data: IconThemeData(
        color: Theme.of(context).cardColor,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                onSubmitted: (value) {
                  _handleSubmitted(_textEditingController.text);
                },
                controller: _textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: "  메시지 보내기",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send,color: donutColorBasic),
                onPressed: () =>
                    _handleSubmitted(_textEditingController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

