import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/views/components/donut_appbar.dart';
import 'package:flutter/material.dart';

class UserReposrtlistPage extends StatelessWidget {
  const UserReposrtlistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: subAppbar("신고 목록"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DataTable(
            border: TableBorder(
                verticalInside: BorderSide(color: Colors.white),
                horizontalInside: BorderSide(color: donutColor1)),
            columnSpacing: 20,
            horizontalMargin: 10,
            headingRowColor: MaterialStatePropertyAll(donutColor1),
            headingTextStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.black),
            columns: const <DataColumn>[
              DataColumn(label: Expanded( flex: 1,child: Text('신고\n일시',textAlign: TextAlign.center))),
              DataColumn(label: Expanded( flex: 1,child: Text('신고 유저',textAlign: TextAlign.center))),
              DataColumn(label: Expanded( flex: 1,child: Text('신고 유형',textAlign: TextAlign.center))),
              DataColumn(label: Expanded( flex: 1,child: Text('처리\n현황',textAlign: TextAlign.center)))
            ],
            dataRowMaxHeight: 100,
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2023\n04/10')),
                  DataCell(Text('닉네임최대몇글자')),
                  DataCell(Text('전문 판매업자 같아요')),
                  DataCell(Text('처리 완료')),
                ],
              ),
              DataRow(
                cells: <DataCell>[
                  DataCell(Text('2023\n04/10')),
                  DataCell(Text('닉네임최대몇글자')),
                  DataCell(Text('전문 판매업자 같아요')),
                  DataCell(Text('처리 완료')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
