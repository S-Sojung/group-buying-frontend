import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';

class UserTabbar extends StatelessWidget {
  final tabController;
  final List<String> tabTitle;
  UserTabbar({required this.tabController,required this.tabTitle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicator: BoxDecoration(
            color: donutColorBasic,
            border: Border(
                bottom: BorderSide(color: donutColorBase, width: 2))),
        controller: tabController,
        unselectedLabelColor: donutColorBasic,
        tabs: [
          Tab(
            text: tabTitle[0],
          ),
          Tab(
            text: tabTitle[1],
          ),
        ]);
  }
}
