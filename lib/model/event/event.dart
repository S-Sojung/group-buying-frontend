class Event {
  final int id;
  final double latitude; // 위도
  final double longitude; // 경도
  final int qty; // 제품 수량
  final String payment_type; // 결제방식
  final DateTime start_at; // 시작일
  final DateTime end_at; // 종료일
  final int status_code; // 상태
  final int price;

  Event({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.qty,
    required this.payment_type,
    required this.start_at,
    required this.end_at,
    required this.status_code,
    required this.price,
  }); // 가격
}

List<Event> events = [
  Event(
      id: 1,
      latitude: 35.156834,
      longitude: 129.058987,
      qty: 1,
      payment_type: "직거래",
      start_at: DateTime.now(),
      end_at: DateTime.now(), // 수정 필요
      status_code: 200,
      price: 900),
  Event(
      id: 2,
      latitude: 35.156834,
      longitude: 129.058987,
      qty: 1,
      payment_type: "직거래",
      start_at: DateTime.now(),
      end_at: DateTime.now(), // 수정 필요
      status_code: 200,
      price: 900),
];
