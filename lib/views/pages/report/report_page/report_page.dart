import 'dart:io';

import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/views/components/donut_appbar.dart';
import 'package:donut/views/components/donut_text_area.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReportPage extends StatefulWidget {
  ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final _titleController = TextEditingController();
  final _userController = TextEditingController();
  final _contentController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Image? _image;
  final _picker = ImagePicker();

  Future<void> _setImage() async {
    var xfile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
    );

    if (xfile != null) {
      setState(() {
        _image = Image.file(File(xfile.path), fit: BoxFit.cover);
        // dynamic sendData = xfile.path;
        // var formData = FormData.fromMap({'images': await MultipartFile.fromFile(sendData)});
      });
    }
  }
  List<String> reportList = <String>['판매 금지 물품이에요', '공동구매 게시글이 아니에요', '전문 판매업자 같아요', '사기 글이에요','사용할 수 없는 상품이에요','비매너 사용자에요','거래 및 환불 분쟁이 일어났어요','목적이 불순해요'];
  String dropdownValue = '판매 금지 물품이에요';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: subAppbar("신고하기"),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DonutTextFormFieldSlim(title: "제목", funValidator: validateTitle(),controller: _titleController,),
              SizedBox(height:20,),
              DonutTextFormFieldSlim(readOnly: true,title: "신고 유저 / 게시글", funValidator: validateContent(),controller: _userController,), //바로 들어가게하기
              SizedBox(height:20,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context)*0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("신고 유형",style: bodyText(),),
                DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: donutColorBasic),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      value: dropdownValue,
                      borderRadius: BorderRadius.circular(20),
                      onChanged: (value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: reportList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )),
              SizedBox(height:20,),
                    Text("사진 등록",style: bodyText(),),
                    Container(
                      height: getScreenWidth(context) * 0.9,
                      width: getScreenWidth(context) * 0.9,
                      child: OutlinedButton(
                          onPressed: _setImage,
                          child: AspectRatio(
                            aspectRatio: 1 / 1,
                            child: _image == null
                                ? const Icon(
                              Icons.camera_alt,
                              color: donutColorBase,
                            )
                                : _image as Image,
                          )),
                    ),
                  ],
                ),
              ),

              SizedBox(height:20,),
              DonutTextArea(title: "신고 내용", hint: "", funValidator: validateContent(),controller: _contentController,),
            ],
          ),
        ),
      ),
    );
  }
}
