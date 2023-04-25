import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/event/event.dart';
import 'package:donut/model/rate/rate.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_rate_bar.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardDetailBody extends StatelessWidget {
  final Board board;

  BoardDetailBody({required this.board, Key? key}) : super(key: key);

//  List<String> tags = [events[board.eventId].paymentType];
  List<String> tags = ["모집 중", "앱결제", "식품", "#편의점", "#삼김"];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            color: Colors.white10,
            width: double.infinity,
            height: 60,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getScreenWidth(context) * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/images/donut.svg",
                        height: 40,
                        width: 40,
                      ),
                      Text(
                        "닉네임최대일곱",
                        style: callout(),
                      )
                    ],
                  ),
                  Container(
                    height: 60,
                    width: getScreenWidth(context) * 0.2,
                    child: DonutMinRateBar(rates[0]),
                  )
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
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
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("${board.content} ${board.content} ${board.content} ${board.content}")),
              ),
                  SizedBox(height: 20,),
                  Divider(color: donutColorBasic, thickness: 2),
            ]),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getScreenWidth(context) * 0.05, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        "assets/images/heart_donut.svg",
                        height: 50,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " 수량 : ${events[0].qty}",
                          style: bodyText(),
                        ),
                        Text(
                          " 개당 ${events[0].price}원",
                          style: bodyText(),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 150,
                  child: DonutButton(text: "참가 하기", funPageRoute: () {}),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
