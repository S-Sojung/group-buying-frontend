import 'package:intl/intl.dart';

class Board {
  int id;
  String title;
  String? content;
  String state;
  String city;
  String town;
  int price;
  int qty;
  String paymentType;
  bool recommend;
  DateTime endAt;

  Board({
    required this.id,
    required this.title,
    this.content,
    required this.state,
    required this.city,
    required this.town,
    required this.price,
    required this.qty,
    required this.paymentType,
    required this.recommend,
    required this.endAt,
  });

  factory Board.fromJson(Map<String, dynamic> json) => Board(
    id: json["id"],
    title: json["title"],
    content: json["content"],
    state: json["state"],
    city: json["city"],
    town: json["town"],
    price: json["price"],
    qty: json["qty"],
    paymentType: json["paymentType"],
    recommend: json["recommend"],
    endAt: DateFormat("yyyy-mm-dd").parse(json["endAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "title": title,
    "content": content,
    "state": state,
    "city": city,
    "town": town,
    "price": price,
    "qty": qty,
    "paymentType": paymentType,
    "recommend": recommend,
    "endAt": endAt,
  };
}