import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/dto/board/board_detail.dart';
import 'package:donut/model/board/mock_board.dart';
import 'package:donut/model/event/event.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SeleteParticipantHeader extends StatelessWidget {
  BoardDetail board;
  SeleteParticipantHeader({required this.board, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: donutColorBasic,width: 1))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:  Image(image: NetworkImage(board.img!),width: 60,height: 60,),
                    // child: Image.asset("assets/images/testimage.jpg",width: 60,height: 60,),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${board.title}",style: headLine(),),
                      Row(
                        children: [
                          Text("개당 ${board.event.price}원",style: bodyText()),
                          DonutRoundTag("${board.event.paymentType}")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Text("${board.city} ${board.town}"),
              Text("${DateFormat.Md().add_jm().format(board.event.endAt)}"),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
