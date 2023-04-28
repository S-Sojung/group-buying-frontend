import 'package:donut/core/constants/style.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/event/event.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:donut/views/pages/board/detail_page/board_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

String image(int index) {
  if (index % 2 == 1) {
    return "assets/images/regular_heart.svg";
  } else {
    return "assets/images/heart_donut.svg";
  }
}

class BoardListTile extends StatelessWidget {
  final Board board;

  const BoardListTile(this.board);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BoardDetailPage(board: board),));
          // 게시글 클릭하면 게시글 상세보기 만들기
        },
        dense: false,
        visualDensity: VisualDensity(vertical: 4),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment(1.2, 1.3),
            children: [
              Image.asset('assets/images/testimage.jpg', fit: BoxFit.fill),
              DonutRectTag("모집중",code: "201"), // 상태에 따라서 이거 변화
            ],
          ),
        ),
        title: Container(
          height: 45,
          child: Text(
            "${board.title}",
            style: headLine(),
            overflow: TextOverflow.clip,
            maxLines: 2,
          ),
        ),
        subtitle: Column(
          children: [
            Row(children: [
              Text(
                "${events[board.eventId - 1].price}원",
                style: bodyText(),
              ),
              DonutRoundTag("${events[board.eventId - 1].paymentType}")
              //태그 리스트
            ]),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      // Text(
                      //   "인원수 ",
                      //   style: footnote(),
                      // ),
                      Text(
                        "${events[board.eventId - 1].qty} 개",
                        style: footnote(mColor: Colors.black),
                      )
                    ]),
                    Text(
                      "${board.state} ${board.city} ${board.town}",
                      style: footnote(),
                    ),
                    Text(
                      "${events[board.eventId - 1].endAt}", // 시간
                      style: footnote(),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  // isSelected: ,
                  // iconSize: 0,
                  onPressed: () {}, // 누를 시 SvgPicture 색 바뀜
                  icon: SvgPicture.asset(image(1)), //내가 마음 했는지 봐야함
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
