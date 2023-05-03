
class ResponseDTO {
  final int? status;
  final String? msg;
  String? token; //나중에 접근해서 담을 수 있게
  dynamic data; // JsonArray [], JsonObject {}

  ResponseDTO({
    this.status,
    this.msg,
    this.data,
  });

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        msg = json["msg"],
        data = json["data"];
}