import 'package:donut/core/constants/style.dart';
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          icon,
          TextButton(
            child: Text("$text",style: bodyText(),),
            onPressed: funRoute,
          ),
        ],
      ),
    );
  }
}

