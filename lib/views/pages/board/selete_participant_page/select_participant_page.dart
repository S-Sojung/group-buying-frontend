import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/model/board/board.dart';
import 'package:donut/model/event/event.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:donut/views/pages/board/selete_participant_page/component/select_participant_body.dart';
import 'package:donut/views/pages/board/selete_participant_page/component/select_participant_header.dart';
import 'package:flutter/material.dart';

class SeleteParticipantPage extends StatelessWidget {
  const SeleteParticipantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            foregroundColor: donutColorBasic,
            backgroundColor: Colors.white10,
            title: Text("예약자 선택"),
          ),
          SeleteParticipantHeader(),
          SelectParticipantBody(),

        ],
      ),
    );
  }
}
