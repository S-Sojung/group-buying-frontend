
import 'dart:convert';
import 'dart:io';

import 'package:donut/dto/my_page/user_profile.dart';
import 'package:donut/dto/response_dto.dart';
import 'package:donut/model/user/user_repository.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  await fetchMyprofile_test();
}

Future<void> fetchMyprofile_test() async {
  String jwt = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJqd3QiLCJyb2xlIjoiUk9MRV9VU0VSIiwiaWQiOjEsImV4cCI6MTY4MzU5MDAwMn0.nH5LKjlvqFBNZxauEniDtkaasd6OhfoQABAiQw0gW5sboPR9Vrpgfnqx1T-pxhF4-k_nMctPA_ko9GQlugj3_g";

  var img = File("C:/Users/G/Desktop/donut/donut.png");
  String base64 = base64Encode(img.readAsBytesSync());
  // print(base64);
  // var decoding = base64Decode(base64);
  // print("${decoding}");
  UserProfileUpdateReq updateuser = UserProfileUpdateReq(password: "1234", profile: base64);
  ResponseDTO responseDTO =await UserRepository().fetchUpdate(updateuser,jwt);
  print(responseDTO.status);
  print(responseDTO.msg);
  UserProfileRes dto = responseDTO.data;
  print(dto.profile);
}

