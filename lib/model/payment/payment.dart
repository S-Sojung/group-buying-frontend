class Payment {
  // 거래(결제) 내역
  final int id;
  final int participantId; // 참가 내역 id
  final String paymentType; // 결제 방식
  final int statusCode; // 상태(결제전 후 완....)
  final bool confirmed; // 구매확인
  final DateTime timestamp;

  Payment({
    required this.id,
    required this.participantId,
    required this.paymentType,
    required this.statusCode,
    required this.confirmed,
    required this.timestamp,
  }); // 구매일자
}

List<Payment> payments = [
  Payment(id: 1, participantId: 1, paymentType: "직거래", statusCode: 401, confirmed: false, timestamp: DateTime.now())
];