import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/pages/board/selete_participant_page/component/select_account_body.dart';
import 'package:donut/views/pages/board/selete_participant_page/component/select_participant_body.dart';
import 'package:donut/views/pages/board/selete_participant_page/component/select_participant_header.dart';
import 'package:flutter/material.dart';

class SelectAccountPage extends StatelessWidget {
  const SelectAccountPage({Key? key}) : super(key: key);

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
          SelectAccountBody(),
        ],
      ),
    );
  }
}
