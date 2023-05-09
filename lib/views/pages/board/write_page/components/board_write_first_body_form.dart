import 'dart:io';

import 'package:dio/dio.dart';
import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/style.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/model/category/mock_category.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_round_tag.dart';
import 'package:donut/views/components/donut_text_area.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:donut/views/pages/board/write_page/board_write_first_page.dart';
import 'package:donut/views/pages/board/write_page/board_write_second_page.dart';
import 'package:donut/views/pages/board/write_page/components/board_write_pay_field.dart';
import 'package:donut/views/pages/board/write_page/components/board_write_second_body_form.dart';
import 'package:donut/views/pages/board/write_page/components/donut_category_dropdown.dart';
import 'package:donut/views/pages/board/write_page/components/donut_tag_button.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class BoardWriteFirstBodyForm extends StatefulWidget {
  BoardWriteFirstBodyForm({Key? key}) : super(key: key);

  @override
  State<BoardWriteFirstBodyForm> createState() =>
      _BoardWriteFirstBodyFormState();
}

class _BoardWriteFirstBodyFormState extends State<BoardWriteFirstBodyForm> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _countController = TextEditingController();
  final _myCountController = TextEditingController();
  final _tagController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  List<String> cate = mockCategories.map((e) => e.name).toList();
  var setDropdownItem = mockCategories[0].name;

  List<String> tags = [""];
  int onePrice = 0;
  int myPrice = 0;
  Image? _image;
  File? imgFile;
  final _picker = ImagePicker();

  Future<void> _setImage() async {
    var xfile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
    );

    if (xfile != null) {
      setState(() {
        _image = Image.file(File(xfile.path), fit: BoxFit.cover);
        imgFile = File(xfile.path);
        // dynamic sendData = xfile.path;
        // var formData = FormData.fromMap({'images': await MultipartFile.fromFile(sendData)});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _tagController.text = "";

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DonutRoundTag("  같이 나눠사고 싶은 상품에 대해 적어주세요.  "),
              SizedBox(
                height: 20,
              ),
              //사진 등록
              Container(
                height: getScreenWidth(context) * 0.7,
                width: getScreenWidth(context) * 0.7,
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
              SizedBox(
                height: 20,
              ),
              DonutTextFormFieldSlim(
                  title: "제목",
                  funValidator: validateTitle(),
                  controller: _titleController),
              SizedBox(
                height: 20,
              ),

              DonutCategoryDropdown(
                fun: (value) {
                  setState(() {
                    setDropdownItem = value;
                  });
                },
                dropDownList: cate,
                dropDownitem: setDropdownItem,
              ),

              SizedBox(
                height: 20,
              ),

              DonutCountFormField(
                  title: "총 금액",
                  funValidator: validPrice(),
                  controller: _priceController),
              Text(
                "참여자에겐 개당 예상 금액만 보여요!",
                style: caption1(mColor: donutColor2),
              ),
              const SizedBox(
                height: 20,
              ),

              DonutCountFormField(
                  title: "총 수량",
                  funValidator: validateCount(),
                  controller: _countController),
              //OnePrice 를 바뀌게 하고 싶음 위의 값이 바뀌면

              BoardWritePayField(
                  funPay: () {
                    setState(() {
                      if (_priceController.text.isEmpty ||
                          _countController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("총 금액과 총 수량을 작성해주세요")));
                        onePrice = 0;
                      } else {
                        onePrice = (int.parse(_priceController.text) /
                                int.parse(_countController.text))
                            .round();
                      }
                    });
                  },
                  onePrice: onePrice),

              const SizedBox(
                height: 20,
              ),

              DonutCountFormField(
                  title: "본인이 구매할 수량",
                  funValidator: validateCount(),
                  controller: _myCountController),

              BoardWritePayField(
                  funPay: () {
                    setState(() {
                      if (_myCountController.text.isEmpty || onePrice == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("개당 예상 금액과 구매할 수량을 체크해주세요")));
                        myPrice = 0;
                      } else {
                        myPrice =
                            (onePrice * int.parse(_myCountController.text));
                      }
                    });
                  },
                  onePrice: myPrice),
              const SizedBox(
                height: 20,
              ),
              DonutTagButton(
                  tagController: _tagController,
                  funAdd: () {
                    setState(() {
                      if (tags.length >= 4) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("해시태그는 최대 세개입니다.")));
                        return null;
                      } else {
                        tags.add(_tagController.text);
                        _tagController.text = "";
                      }
                    });
                  }),
              Text(
                "해시태그는 최대 3개 까지 가능합니다.\n"
                    "해시태그는 클릭하면 삭제할 수 있습니다",
                style: caption1(mColor: donutColor2),
              ),
              Container(
                width: getScreenWidth(context) * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(tags.length, (index) {
                    if (tags[index] == "") {
                      return Text("");
                    } else {
                      return InkWell(
                        child: DonutRoundTag(tags[index]),
                        onTap: () {
                          setState(() {
                            tags.removeAt(index);
                          });
                        },
                      );
                    }
                  }),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              Container(
                width: getScreenWidth(context) * 0.9,
                child: DonutButton(
                    text: "장소와 시간 설정하기",
                    funPageRoute: () {
                      if (_formKey.currentState!.validate()) {
                        if (_titleController.text.isEmpty ||
                            onePrice == 0 ||
                            myPrice == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("빈칸이 없는지 확인해주세요")));
                        } else {
                          print("사진 : ${_image}");
                          print("제목 : ${_titleController.text}");
                          print("카테고리 : ${setDropdownItem}");
                          print("총 금액 : ${_priceController.text}");
                          print("총 수량 : ${_countController.text}");
                          print("내가 구매할 수량 : ${_myCountController.text}");
                          print("개당 수량 : ${onePrice}");
                          int qty = int.parse(_countController.text) - int.parse(_myCountController.text);
                          print("상대방이 선택가능한 수량 : ${qty}");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BoardWriteSecondPage(imgFile: imgFile,title: _titleController.text,category: setDropdownItem,onePrice: onePrice,qty: qty,tags: tags ),
                              ));
                        }
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

