
class ResponseDTO {
  final int? code;
  final String? msg;
  String? token; //나중에 접근해서 담을 수 있게
  dynamic data; // JsonArray [], JsonObject {}

  ResponseDTO({
    this.code,
    this.msg,
    this.data,
  });

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        msg = json["msg"],
        data = json["data"];
}