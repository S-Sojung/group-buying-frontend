import 'dart:io';

import 'package:donut/controller/user_controller.dart';
import 'package:donut/core/constants/size.dart';
import 'package:donut/core/constants/theme.dart';
import 'package:donut/core/utils/validator_util.dart';
import 'package:donut/model/user/user.dart';
import 'package:donut/provider/session_provider.dart';
import 'package:donut/views/components/donut_appbar.dart';
import 'package:donut/views/components/donut_button.dart';
import 'package:donut/views/components/donut_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdatePage extends ConsumerStatefulWidget {

  ProfileUpdatePage({ Key? key}) : super(key: key);

  @override
  _ProfileUpdatePageState createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends ConsumerState<ProfileUpdatePage> {

  final _passwordController = TextEditingController();

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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SessionUser sessionUser = ref.read(sessionProvider);

    return Scaffold(
      appBar: subAppbar("프로필 수정"),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            DonutTextFormField(
                title: "비밀번호 확인",
                hint: "password",
                funValidator: validatePassword(),
                controller: _passwordController),
            SizedBox(
              height: 40,
            ),
            Container(
              width: getScreenWidth(context)*0.9,
              child: DonutButton(text: "프로필 수정 완료", funPageRoute: (){
                ref.read(userControllerProvider).updateProfile(_passwordController.text, _image!.image.toString().split("\"")[1], sessionUser.jwt!);
              }),
            )
          ],
        ),
      ),
    );
  }
}
