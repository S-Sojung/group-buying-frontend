import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:flutter/material.dart';

class DonutCategoryDropdown extends StatelessWidget {
  List<String> dropDownList;
  String dropDownitem;

  DonutCategoryDropdown({required this.dropDownitem, required this.dropDownList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05,vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("카테고리",style: callout(),),
          DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: donutColorBasic),
                  borderRadius: BorderRadius.circular(10),
              ),
              child:Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child:DropdownButton(
                    value: dropDownitem,
                    items: dropDownList.map((String item) {
                      return DropdownMenuItem<String>(
                        child: Text('$item'),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (value){
                      dropDownitem = value!;
                    },
                    style: bodyText(),
                    underline: Container(color: donutColorBase,), //remove underline
                    isExpanded: true, //make true to make width 100%
                  )
              )
          ),
        ],
      ),
    );
  }
}
