class Event {
  final int id;
  final double latitude; // 위도
  final double longitude; // 경도
  final int qty; // 제품 수량
  final String paymentType; // 결제방식
  final DateTime startAt; // 시작일
  final DateTime endAt; // 종료일
  final int statusCode; // 상태
  final int price;
  final DateTime createdAt; // 시작일

  Event({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.qty,
    required this.paymentType,
    required this.startAt,
    required this.endAt,
    required this.statusCode,
    required this.price,
    required this.createdAt
  }); // 가격
}

List<Event> events = [
  Event(
      id: 1,
      latitude: 35.156834,
      longitude: 129.058987,
      qty: 1,
      paymentType: "직거래",
      startAt: DateTime.now(),
      endAt: DateTime.now(), // 수정 필요
      statusCode: 200,
      price: 900,
      createdAt: DateTime.now()
  ),
  Event(
      id: 2,
      latitude: 35.156834,
      longitude: 129.058987,
      qty: 1,
      paymentType: "직거래",
      startAt: DateTime.now(),
      endAt: DateTime.now(), // 수정 필요
      statusCode: 200,
      price: 900,
      createdAt: DateTime.now()
  ),
];
