import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/model/my_account/my_account.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:flutter/material.dart';

class SelectAccountBody extends StatefulWidget {
  const SelectAccountBody({Key? key}) : super(key: key);

  @override
  State<SelectAccountBody> createState() => _SelectAccountBodyState();
}

class _SelectAccountBodyState extends State<SelectAccountBody> {
  List<MyAccount> myAccounts = [MyAccount(id: 1, userId: 1, brand: "농협", accountNumber: "0000000000000", createdAt: DateTime.now())];
  String _selected = '대표 계좌 번호';
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getScreenWidth(context) * 0.05, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 400,
              child: ListView.builder(
                itemCount: myAccounts.length,
                itemBuilder: (context, index) {
                  if(index < myAccounts.length) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: 70,
                        child: RadioListTile(
                          groupValue: _selected,
                          value: '대표 계좌 번호',
                          onChanged: (value) {
                            setState(() {
                              _selected = value!;
                              _active = false;

                            });

                          },
                          title: Text(
                              "${myAccounts[index].brand}"),
                          subtitle: Text(
                            "${myAccounts[index].accountNumber}",
                            style: caption1(),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            DonutButton(text: "새 계좌 등록하러 가기 ", funPageRoute: (){}),
            SizedBox(height: 30,),
            DonutButton(text: "예약중으로 변경하고 채팅하기", funPageRoute: (){}),
          ],
        ),
      ),
    );
  }
}
