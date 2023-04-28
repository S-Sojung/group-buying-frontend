import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';

/*
(200, 'board', '모집중');
(201, 'board', '거래중');
(202, 'board', '마감');
(203, 'board', '삭제');
 */
Color setRoundColor(String code){
  if(code=="200") {
    return donutGray100;
  }else if(code=="202"){
    return donutGrayAA300;
  }else{
    return donutColor1;
  }
}

Color setRectColor(String code){
  if(code=="0") { //직거래
    return donutGray100;
  }else{ // 앱결제
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
      decoration: BoxDecoration(
        color: setRoundColor(code),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 0,horizontal: 10),
      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 2),
      child: Text(" ${comment} ",style: caption1(),textAlign: TextAlign.center
    ),);
  }
}


class DonutRectTag extends StatelessWidget {
  final String comment;
  final String code;
  const DonutRectTag(this.comment,{this.code="0" ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: code=="202" ? 50 : null ,
      width: code=="202" ? 80 : 50 ,
      decoration: BoxDecoration(
        color: setRectColor(code),
      ),
      margin: EdgeInsets.symmetric(vertical: 5,),
      padding: EdgeInsets.all(1),
      child: Text(" ${comment} ",style: caption2(mColor: code=="202"? Colors.white : Colors.black ),textAlign: TextAlign.center,
      ),);
  }
}
