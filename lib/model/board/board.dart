
import 'package:donut/model/board/organizer.dart';
import 'package:donut/model/category/category.dart';
import 'package:donut/model/event/event.dart';
import 'package:intl/intl.dart';

class Board {
  int id;
  String title;
  String img;
  String state;
  String city;
  String town;
  int price;
  int qty;
  double latitude;
  double longtitude;
  String paymentType;
  bool recommend;
  DateTime endAt;

  Board({
    required this.id,
    required this.title,
    required this.img,
    required this.state,
    required this.city,
    required this.town,
    required this.price,
    required this.qty,
    required this.latitude,
    required this.longtitude,
    required this.paymentType,
    required this.recommend,
    required this.endAt,
  });

  factory Board.fromJson(Map<String, dynamic> json) => Board(
        id: json["id"],
        title: json["title"],
        img: json["img"],
        state: json["state"],
        city: json["city"],
        town: json["town"],
        price: json["price"],
        qty: json["qty"],
        latitude: json["latitude"]?.toDouble(),
        longtitude: json["longtitude"]?.toDouble(),
        paymentType: json["paymentType"],
        recommend: json["recommend"],
        //${DateFormat.yMd().add_jm().format(board.event.endAt)
        endAt: DateTime.parse(json["endAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "img": img,
        "state": state,
        "city": city,
        "town": town,
        "price": price,
        "qty": qty,
        "latitude": latitude,
        "longtitude": longtitude,
        "paymentType": paymentType,
        "recommend": recommend,
        "endAt": endAt.toIso8601String(),
      };
}