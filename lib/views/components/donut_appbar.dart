import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';


AppBar subAppbar(title) {
  return AppBar(
      elevation: 0,
      backgroundColor: Colors.white10,
      foregroundColor: donutColorBasic,
      title: Text("${title}"),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: 30,
            )),
      ]
  );
}

