class Participant {
  // 이벤트 참가자 (대기열)
  final int id;
  final int eventId; // 이벤트 id
  final int userId; // 참가자 id
  final int qty; // 신청수량
  final DateTime? limitTime;
  final int statusCode;
  final DateTime createdAt; // 신청 일자

  Participant({
    required this.id,
    required this.eventId,
    required this.userId,
    required this.qty,
     this.limitTime,
    required this.statusCode,
    required this.createdAt,
  });
}

List<Participant> participants = [
  Participant(
      id: 1,
      eventId: 1,
      userId: 2,
      qty: 1,
      createdAt: DateTime.now(),
      statusCode: 300),
  Participant(
      id: 2,
      eventId: 1,
      userId: 3,
      qty: 1,
      createdAt: DateTime.now(),
      statusCode: 300)
];
