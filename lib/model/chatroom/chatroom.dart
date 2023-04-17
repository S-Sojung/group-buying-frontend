class Chatroom {
  // 채팅방 목록
  final int id;
  final int statusCode;
  final DateTime createdAt;

  Chatroom({
    required this.id,
    required this.statusCode,
    required this.createdAt,
  });
}

List<Chatroom> chatrooms = [
  Chatroom(id: 1, statusCode: 500, createdAt: DateTime.now())
];