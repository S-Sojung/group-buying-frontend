//휴대폰 앱 내의 임시 공간에 접근 가능
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dio = Dio(BaseOptions(
  baseUrl: "http://192.168.200.171:8080", // 추후 수정 필요
  contentType: "application/json; charset=utf-8",
));

const secureStorage = FlutterSecureStorage();