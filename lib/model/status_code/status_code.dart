
class StatusCode{
  final int id;
  final String type;
  final String status;
  final DateTime createdAt;

  StatusCode({required this.id,required this.type,required this.status,required this.createdAt});
}


List<StatusCode> codes=[
  StatusCode(id: 100, type: "user", status: "활성화",createdAt: DateTime.now()),
  StatusCode(id: 101, type: "user", status: "휴면",createdAt: DateTime.now()),
  StatusCode(id: 102, type: "user", status: "탈퇴",createdAt: DateTime.now()),
  StatusCode(id: 200, type: "board", status: "진행중",createdAt: DateTime.now()),
  StatusCode(id: 201, type: "board", status: "거래완료",createdAt: DateTime.now()),
  StatusCode(id: 202, type: "board", status: "마감",createdAt: DateTime.now()),
  StatusCode(id: 203, type: "board", status: "삭제",createdAt: DateTime.now()),
  StatusCode(id: 300, type: "participant", status: "참가",createdAt: DateTime.now()),
  StatusCode(id: 301, type: "participant", status: "미채택",createdAt: DateTime.now()),
  StatusCode(id: 302, type: "participant", status: "채택",createdAt: DateTime.now()),
  StatusCode(id: 303, type: "participant", status: "참가 취소",createdAt: DateTime.now()),
  StatusCode(id: 400, type: "payment", status: "결제전",createdAt: DateTime.now()),
  StatusCode(id: 401, type: "payment", status: "결제완료",createdAt: DateTime.now()),
  StatusCode(id: 402, type: "payment", status: "구매확정",createdAt: DateTime.now()),
  StatusCode(id: 500, type: "chatroom", status: "활성화",createdAt: DateTime.now()),
  StatusCode(id: 501, type: "chatroom", status: "비활성화",createdAt: DateTime.now()),
  StatusCode(id: 502, type: "chatroom", status: "삭제",createdAt: DateTime.now()),
  StatusCode(id: 600, type: "report", status: "대기",createdAt: DateTime.now()),
  StatusCode(id: 601, type: "report", status: "처리중",createdAt: DateTime.now()),
  StatusCode(id: 602, type: "report", status: "처리완료",createdAt: DateTime.now()),
];