
import 'package:flutter/material.dart';

class BoardCategoryAppbar extends StatelessWidget {
  const BoardCategoryAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
    );
  }
}
