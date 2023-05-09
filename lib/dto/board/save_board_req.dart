class BoardSaveReq {
  int categoryId;
  String title;
  String content;
  dynamic img;
  String state;
  String city;
  String town;
  double latitude;
  double longtitude;
  int qty;
  String paymentType;
  DateTime endAt;
  int price;
  List<dynamic> comment;

  BoardSaveReq({
    required this.categoryId,
    required this.title,
    required this.content,
    this.img,
    required this.state,
    required this.city,
    required this.town,
    required this.latitude,
    required this.longtitude,
    required this.qty,
    required this.paymentType,
    required this.endAt,
    required this.price,
    required this.comment,
  });

  factory BoardSaveReq.fromJson(Map<String, dynamic> json) => BoardSaveReq(
    categoryId: json["categoryId"],
    title: json["title"],
    content: json["content"],
    img: json["img"],
    state: json["state"],
    city: json["city"],
    town: json["town"],
    latitude: json["latitude"]?.toDouble(),
    longtitude: json["longtitude"]?.toDouble(),
    qty: json["qty"],
    paymentType: json["paymentType"],
    endAt: DateTime.parse(json["endAt"]),
    price: json["price"],
    comment: List<dynamic>.from(json["comment"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
    "title": title,
    "content": content,
    "img": img,
    "state": state,
    "city": city,
    "town": town,
    "latitude": latitude,
    "longtitude": longtitude,
    "qty": qty,
    "paymentType": paymentType,
    "endAt": endAt.toIso8601String(),
    "price": price,
    "comment": List<dynamic>.from(comment.map((x) => x)),
  };
}
