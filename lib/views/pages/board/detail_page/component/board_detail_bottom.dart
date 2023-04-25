import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/model/event/event.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardDetailBottom extends StatelessWidget {
  const BoardDetailBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return         SliverToBoxAdapter(
      child:         Padding(
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
    );
  }
}
