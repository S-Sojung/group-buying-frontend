import 'package:donut/core/constants/style.dart';
import 'package:donut/views/components/donut_round_tag.dart';
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
  final int index;

  const BoardListTile(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: ListTile(
        onTap: () {
          // 게시글 클릭하면 게시글 상세보기 만들기
        },
        dense: true,
        isThreeLine: true,
        visualDensity: VisualDensity(vertical: 4),
        // to compact
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            alignment: Alignment(1.2, 1.3),
            children: [
              Container(
                height: 70,
                width: 70,
                child: Image.asset("assets/images/testimage.jpg"),
              ),
              DonutRectTag("모집중"), // 상태에 따라서 이거 변화
            ],
          ),
        ),
        title: Container(
          height: 45,
          child: Text(
            "아기 물티슈 10+10 나눌 분 구해요 ${index + 99}",
            style: headLine(),
            overflow: TextOverflow.clip,
            maxLines: 2,

          ),
        ),
        subtitle: Column(
          children: [
            Row(children: [
              Text(
                "개당 100${index} 원",
                style: bodyText(),
              ),
              DonutRoundTag("직거래")
            ]),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(
                        "인원수 ",
                        style: footnote(),
                      ),
                      Text(
                        "수량 ",
                        style: footnote(),
                      )
                    ]),
                    Row(children: [
                      Text(
                        "위치 ",
                        style: footnote(),
                      ),
                      Text(
                        "시간 ",
                        style: footnote(),
                      ),
                    ]),
                  ],
                ),
                Spacer(),
                IconButton(
                  // isSelected: ,
                  // iconSize: 0,
                  onPressed: () {},
                  icon: SvgPicture.asset(image(index)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
