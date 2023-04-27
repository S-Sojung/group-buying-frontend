import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';

class DonutTextButton extends StatelessWidget {
  final icon;
  final String text;
  final funRoute;


  const DonutTextButton({
    required this.icon,
    required this.text,
    required this. funRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 2),
      child: Row(
        children: [
          icon,
          Expanded(
            child: TextButton(
              style: ButtonStyle(alignment: Alignment.centerLeft),
              child: Text("$text",style: bodyText()),
              onPressed: funRoute,
            ),
          ),
        ],
      ),
    );
  }
}

