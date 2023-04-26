import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/chatter_list/chatter_list.dart';
import 'package:donut/views/pages/chat/room_page/chat_room_page.dart';
import 'package:flutter/material.dart';

class DonutChatList extends StatelessWidget {
  const DonutChatList({
    super.key,
    required this.chatterList,
  });

  final ChatterList chatterList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatRoomPage(),
          ),
        );
      },
      child: Container(
        height: getScreenHeigth(context)*0.1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: donutColorBasic,
                  ),
                  title: Row(
                    children: [
                      Text(
                        chatterList.title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text("인원수3명"),
                    ],
                  ),
                  subtitle: Text(chatterList.content),
                  contentPadding: const EdgeInsets.all(0),
                ),
              ),
              Column(
                children: [
                  Text(
                    chatterList.time,
                    style: TextStyle(color: Color(0xFFa5a5a5), fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  if (chatterList.count != "0") // 1
                    Container(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFde6344)),
                      child: Text(
                        chatterList.count,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}