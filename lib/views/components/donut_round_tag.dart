import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';


Color setColor(String code){
  if(code=="0") {
    return donutGray100;
  }else{
    return donutColor1;
  }
}

class DonutRoundTag extends StatelessWidget {
  final String comment;
  final String code;
  const DonutRoundTag(this.comment,{this.code="0" ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: setColor(code),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 2),
      padding: EdgeInsets.all(1),
      child: Text(" ${comment} ",style: caption1()
    ),);
  }
}
