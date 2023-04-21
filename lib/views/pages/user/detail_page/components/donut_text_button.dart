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
    return Row(
      children: [
        icon,
        TextButton(
          child: Text("$text"),
          onPressed: funRoute,
        ),
      ],
    );
  }
}

