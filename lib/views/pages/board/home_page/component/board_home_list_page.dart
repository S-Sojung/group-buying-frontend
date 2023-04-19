import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:donut/views/pages/board/home_page/component/board_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoardHomeListPage extends StatelessWidget {
  const BoardHomeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: Container(
                  height: 50.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10, // 선택한 카테고리 갯수
                    itemBuilder: (context, index) {
                      // 카테고리 들
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: FilterChip(
                            label: Text("카테고리${index}"),
                            onSelected: (value) {}),
                      );
                    },
                  ),
                ),
              )
            ],
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: getScreenHeigth(context)*0.75,
                child: ListView.builder(
                  itemCount: 10, // 선택한 게시글 갯수
                  itemBuilder: (context, index) {
                    //게시글 넘겨주기
                    return BoardListTile(index);
                  },
                ),
              ),
            ),
          ],
        ));
  }
}

