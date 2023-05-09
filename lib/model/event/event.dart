import 'package:intl/intl.dart';

class Event {
  int id;
  double latitude;
  double longtitude;
  int qty;
  String paymentType;
  DateTime startAt;
  DateTime endAt;
  int price;
  DateTime createdAt;

  Event({
    required this.id,
    required this.latitude,
    required this.longtitude,
    required this.qty,
    required this.paymentType,
    required this.startAt,
    required this.endAt,
    required this.price,
    required this.createdAt,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    latitude: json["latitude"]!.toDouble(),
    longtitude: json["longtitude"]!.toDouble(),
    qty: json["qty"],
    paymentType: json["paymentType"],
    startAt: DateTime.parse(json["created"]),
    endAt: DateTime.parse(json["created"]),
    price: json["price"],
    createdAt: DateTime.parse(json["created"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "latitude": latitude,
    "longtitude": longtitude,
    "qty": qty,
    "paymentType": paymentType,
    "startAt": startAt,
    "endAt": endAt,
    "price": price,
    "createdAt": createdAt,
  };
}

List<Event> events = [
  Event(
      id: 1,
      latitude: 35.156834,
      longtitude: 129.058987,
      qty: 1,
      paymentType: "직거래",
      startAt: DateTime.now(),
      endAt: DateTime.now(), // 수정 필요
      price: 900,
      createdAt: DateTime.now()
  ),
  Event(
      id: 2,
      latitude: 35.156834,
      longtitude: 129.058987,
      qty: 1,
      paymentType: "직거래",
      startAt: DateTime.now(),
      endAt: DateTime.now(), // 수정 필요
      price: 900,
      createdAt: DateTime.now()
  ),
  Event(
      id: 3,
      latitude: 35.156834,
      longtitude: 129.058987,
      qty: 1,
      paymentType: "직거래",
      startAt: DateTime.now(),
      endAt: DateTime.now(), // 수정 필요
      price: 900,
      createdAt: DateTime.now()
  ),
  Event(
      id: 4,
      latitude: 35.156834,
      longtitude: 129.058987,
      qty: 1,
      paymentType: "직거래",
      startAt: DateTime.now(),
      endAt: DateTime.now(), // 수정 필요
      price: 900,
      createdAt: DateTime.now()
  ),
  Event(
      id: 5,
      latitude: 35.156834,
      longtitude: 129.058987,
      qty: 1,
      paymentType: "직거래",
      startAt: DateTime.now(),
      endAt: DateTime.now(), // 수정 필요
      price: 900,
      createdAt: DateTime.now()
  ),
  Event(
      id: 6,
      latitude: 35.156834,
      longtitude: 129.058987,
      qty: 1,
      paymentType: "직거래",
      startAt: DateTime.now(),
      endAt: DateTime.now(), // 수정 필요
      price: 900,
      createdAt: DateTime.now()
  ),
  Event(
      id: 7,
      latitude: 35.156834,
      longtitude: 129.058987,
      qty: 1,
      paymentType: "직거래",
      startAt: DateTime.now(),
      endAt: DateTime.now(), // 수정 필요
      price: 900,
      createdAt: DateTime.now()
  ),
];
