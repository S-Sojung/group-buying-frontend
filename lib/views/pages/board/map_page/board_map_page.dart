import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:flutter/material.dart';

class BoardMapPage extends StatelessWidget {
  const BoardMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Align(alignment:Alignment.center ,child: Text("위치 지도 나오는 화면"))
        ),

      ],
    );
  }
}
