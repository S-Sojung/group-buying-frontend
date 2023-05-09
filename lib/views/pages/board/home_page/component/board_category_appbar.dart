
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/category/category.dart';
import 'package:flutter/material.dart';

class BoardCategoryAppbar extends StatefulWidget {
  List<Category> categories = [];
  BoardCategoryAppbar({ required this.categories, Key? key}) : super(key: key);

  @override
  State<BoardCategoryAppbar> createState() => _BoardCategoryAppbarState();
}

class _BoardCategoryAppbarState extends State<BoardCategoryAppbar> {
  int? value ;

  @override
  Widget build(BuildContext context) {

    return SliverToBoxAdapter(
      child: Container(
        height: 50.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.categories.length, // 선택한 카테고리 갯수
          itemBuilder: (context, index) {
            // 카테고리 들
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ChoiceChip(
                label: Text('${widget.categories[index].name}'),
                selectedColor: donutColorBasic,
                selected: value == index,
                onSelected: (bool selected) {
                  setState(() {
                    value = selected ? index : null;
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
