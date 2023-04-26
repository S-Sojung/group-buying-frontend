import 'package:donut/core/constants/size.dart';
import 'package:donut/model/chatter_list/chatter_list.dart';
import 'package:donut/views/pages/chat/list_page/components/donut_chat_list.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatelessWidget {
  final ChatterList chatterList;
  const ChatListPage({required this.chatterList,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            height: getScreenHeigth(context)*0.75,
            child: ListView.builder(
              itemCount: chatterLists.length,
                itemBuilder: (context, index) {
                  return DonutChatList(chatterList: chatterLists[index]);
                }
            ),
          ),
        ),
      ],
    );
  }
}

