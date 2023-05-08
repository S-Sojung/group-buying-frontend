

class MyAccountReqDTO {
  String brand;
  String accountNumber;

  MyAccountReqDTO({
    required this.brand,
    required this.accountNumber,
  });

  factory MyAccountReqDTO.fromJson(Map<String, dynamic> json) => MyAccountReqDTO(
    brand: json["brand"],
    accountNumber: json["accountNumber"],
  );

  Map<String, dynamic> toJson() => {
    "brand": brand,
    "accountNumber": accountNumber,
  };
}
