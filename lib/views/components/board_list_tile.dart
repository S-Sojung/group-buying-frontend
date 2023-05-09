import 'package:donut/core/constants/style.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/board/mock_board.dart';
import 'package:donut/model/event/event.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:donut/views/pages/board/detail_page/board_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';



class BoardListTile extends StatefulWidget {
  final Board board;

  const BoardListTile(this.board);

  @override
  State<BoardListTile> createState() => _BoardListTileState();
}
class _BoardListTileState extends State<BoardListTile> {
  int like = 0;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(top: 20),
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BoardDetailPage(board: widget.board),));
          // 게시글 클릭하면 게시글 상세보기 만들기
        },
        dense: false,
        visualDensity: VisualDensity(vertical: 4),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment(1.2, 1.3),
            children: [
              Image(image: NetworkImage(widget.board.img),height: 80,width: 80),
              // Image.asset('assets/images/testimage.jpg', fit: BoxFit.fill),
            ],
          ),
        ),
        title: Container(
          height: 45,
          child: Text(
            "${widget.board.title}",
            style: headLine(),
            overflow: TextOverflow.clip,
            maxLines: 2,
          ),
        ),
        subtitle: Column(
          children: [
            Row(children: [
              Text(
                "${widget.board.price}원",
                style: bodyText(),
              ),
              DonutRoundTag("${widget.board.paymentType}"),

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
                        "${widget.board.qty} 개",
                        style: footnote(mColor: Colors.black),
                      )
                    ]),
                    Text(
                      "${widget.board.state} ${widget.board.city} ${widget.board.town}",
                      style: footnote(),
                    ),
                    Text(
                      "${DateFormat.Md().add_jm().format(widget.board.endAt)}", // 시간
                      style: footnote(),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  // isSelected: ,
                  // iconSize: 0,
                  onPressed: () {
                    setState(() {
                      if(like==1){
                        like = 0;
                      }else{
                        like = 1;
                      }
                    });
                  }, // 누를 시 SvgPicture 색 바뀜
                  icon: SvgPicture.asset(image(like)), //내가 마음 했는지 봐야함
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  String image(int like) {
    if (like == 0) {
      return "assets/images/regular_heart.svg";
    } else {
      return "assets/images/heart_donut.svg";
    }
  }
}
