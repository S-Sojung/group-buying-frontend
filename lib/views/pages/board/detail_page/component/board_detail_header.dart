import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/dto/board/board_detail.dart';
import 'package:donut/model/rate/rate.dart';
import 'package:donut/views/components/donut_rate_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardDetailHeader extends StatelessWidget {
  BoardDetail board;

  BoardDetailHeader({required this.board, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
                    "${board.organizer.username}",
                    style: callout(),
                  )
                ],
              ),
              Container(
                height: 60,
                width: getScreenWidth(context) * 0.2,
                child: DonutMinRateBar(Rate(id: board.organizer.rate.id,
                    rateName: board.organizer.rate.rateName,
                    createdAt:board.organizer.rate.createdAt
                ), ratePoint: board.organizer.ratePoint,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
