import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';

class DonutCountField extends StatefulWidget {
  const DonutCountField({Key? key}) : super(key: key);

  @override
  State<DonutCountField> createState() => _DonutCountFieldState();
}



class _DonutCountFieldState extends State<DonutCountField> {
  int count = 0;

  void func() {
    setState(() {
      count--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getScreenWidth(context) * 0.05, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: getScreenWidth(context) * 0.95 - 110,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: donutColorBasic)),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${count}",
                  style: bodyText(),
                )),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: donutColorBasic)),
            child: IconButton(
                onPressed: count<=0 ? null : func,
                icon: Icon(
                  Icons.remove,
                  size: 22,
                ),
                color: donutColorBasic,
                disabledColor: donutGray200
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: donutColorBasic)),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    count++;
                  });
                },
                icon: Icon(
                  Icons.add,
                  size: 22,
                  color: donutColorBasic,
                )),
          ),
        ],
      ),
    );
  }
}
