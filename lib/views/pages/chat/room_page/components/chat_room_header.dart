import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/dto/board/board_detail.dart';
import 'package:donut/model/board/mock_board.dart';
import 'package:donut/model/event/event.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:donut/views/pages/board/detail_page/board_detail_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ChatRoomHeader extends ConsumerWidget {
  final paymentFunc;
  const ChatRoomHeader({required this.paymentFunc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    BoardDetailPageModel? model = ref.watch(boardDetailPageProvider(1));

    if (model == null) {
      return const CircularProgressIndicator();
    } else {
      BoardDetailDto boardDetailDto = model.board;

      return Container(
        decoration: BoxDecoration(border: Border(
            bottom: BorderSide(color: donutColorBasic, width: 1))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getScreenWidth(context) * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(image: NetworkImage(boardDetailDto.board.img!),width: 60,height: 60,),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${boardDetailDto.board.title}", style: headLine(),),
                      Row(
                        children: [
                          Text("개당 ${boardDetailDto.board.event.price}원", style: bodyText()),
                          DonutRoundTag("${boardDetailDto.board.event.paymentType}")
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${boardDetailDto.board.city} ${boardDetailDto.board.town}"),
                      Text("${DateFormat.Md().add_jm().format(boardDetailDto.board.event.endAt)}"),
                    ],),
                  Container(
                    width: 70,
                    child: DonutButton(text: "송금", funPageRoute: paymentFunc),
                  )
                ],
              ),

              SizedBox(height: 10,)
            ],
          ),
        ),
      );
    }
  }
}
