import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/event/event.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:flutter/material.dart';

class BoardDetailBodyContent extends StatelessWidget {
  final Board board;
  final List<String> tags;
  BoardDetailBodyContent({required this.board, required this.tags, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset("assets/images/testimage.jpg"),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenWidth(context) * 0.05, vertical: 5),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${board.title}",
                  style: bodyText(),
                )),
          ),
          Divider(color: donutColorBasic, thickness: 2),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenWidth(context) * 0.05, vertical: 5),
            child: Column(
              children: [
                Row(
                  children: List.generate(tags.length, (index) {
                    return DonutRoundTag(tags[index]);
                  }),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${board.city}  ${board.town}",
                      style: caption1(mColor: donutGray200),
                    ),
                    Text("${events[0].endAt}",
                        style: caption1(mColor: donutGray200))
                  ],
                )

              ],
            ),
          ),
          Divider(color: donutColorBasic, thickness: 2),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenWidth(context) * 0.05, vertical: 5),
            child: Container(
              constraints:BoxConstraints(
                minHeight: 120
              ),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("${board.content} ${board.content} ${board.content} ${board.content}")),
            ),
          ),
          SizedBox(height: 20,),
          Divider(color: donutColorBasic, thickness: 2),
        ]),
      ),
    );
  }
}
