//리얼타임데이터 일텐데 일단 임시로 넣기

class ChatLog {
  // 대화 로그
  final int id;
  final int chatRoomId; // 대화방 id
  final String chat; // 채팅글
  final int speakerId; // 채팅을 한 유저
  final int listenerId; // 발신자 외 모든 참가자
  final DateTime createdAt;

  ChatLog({
    required this.id,
    required this.chatRoomId,
    required this.chat,
    required this.speakerId,
    required this.listenerId,
    required this.createdAt,
  });
}

List<ChatLog> chatLogs =[
  ChatLog(id: 1, chatRoomId: 1, chat: "몇분쯤 걸리시나요?", speakerId: 1, listenerId: 2, createdAt: DateTime.now()),
  ChatLog(id: 1, chatRoomId: 1, chat: "몇분쯤 걸리시나요?", speakerId: 1, listenerId: 3, createdAt: DateTime.now()),
];