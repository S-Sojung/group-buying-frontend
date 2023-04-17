class ChatterList {
  // 채팅 참가자 목록
  final int id;
  final int chatroomId;
  final int userId;

  ChatterList({
    required this.id,
    required this.chatroomId,
    required this.userId,
  });
}

List<ChatterList> chatterLists =[
  ChatterList(id: 1, chatroomId: 1, userId: 1),
  ChatterList(id: 1, chatroomId: 1, userId: 2),
  ChatterList(id: 1, chatroomId: 1, userId: 3),
];