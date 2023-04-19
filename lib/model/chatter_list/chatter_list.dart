class ChatterList {
  // 채팅 참가자 목록
  final int id;
  final int chatroomId;
  final int userId;
  final DateTime createdAt;

  ChatterList({
    required this.id,
    required this.chatroomId,
    required this.userId,
    required this.createdAt
  });
}

List<ChatterList> chatterLists =[
  ChatterList(id: 1, chatroomId: 1, userId: 1,createdAt: DateTime.now()),
  ChatterList(id: 1, chatroomId: 1, userId: 2,createdAt: DateTime.now()),
  ChatterList(id: 1, chatroomId: 1, userId: 3,createdAt: DateTime.now()),
];