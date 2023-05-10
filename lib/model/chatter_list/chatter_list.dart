class ChatterList {
  // 채팅 참가자 목록
  final int id;
  final String image;
  final String title;
  final String content;
  final String count;
  final String time;
  final int chatroomId;
  final int userId;
  final DateTime createdAt;

  ChatterList({
    required this.id,
    required this.image,
    required this.title,
    required this.content,
    required this.count,
    required this.time,
    required this.chatroomId,
    required this.userId,
    required this.createdAt
  });
}

List<ChatterList> chatterLists =[
  ChatterList(id: 1,image: "images/assets/dounut.svg", title:"삼각김밥 1+1 같이 사실분?",content: " ", count: "0",time: " ", chatroomId: 1, userId: 1,createdAt: DateTime.now()),
  // ChatterList(id: 1,image: "images/assets/dounut.svg", title:"제목",content: "내용입니다", count: "5",time: "오후 08:00", chatroomId: 1, userId: 1,createdAt: DateTime.now()),
  // ChatterList(id: 1,image: "images/assets/dounut.svg", title:"제목",content: "내용입니다", count: "1",time: "오후 03:00", chatroomId: 1, userId: 1,createdAt: DateTime.now()),
];