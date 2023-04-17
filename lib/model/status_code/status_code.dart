
class StatusCode{
  final int id;
  final String type;
  final String status;

  StatusCode({required this.id,required this.type,required this.status});
}


List<StatusCode> codes=[
  StatusCode(id: 100, type: "user", status: "활성화"),
  StatusCode(id: 101, type: "user", status: "휴면"),
  StatusCode(id: 102, type: "user", status: "탈퇴"),
  StatusCode(id: 200, type: "board", status: "진행중"),
  StatusCode(id: 201, type: "board", status: "거래완료"),
  StatusCode(id: 202, type: "board", status: "마감"),
  StatusCode(id: 203, type: "board", status: "삭제"),
  StatusCode(id: 300, type: "participant", status: "참가"),
  StatusCode(id: 301, type: "participant", status: "미채택"),
  StatusCode(id: 302, type: "participant", status: "채택"),
  StatusCode(id: 303, type: "participant", status: "참가 취소"),
  StatusCode(id: 400, type: "payment", status: "결제전"),
  StatusCode(id: 401, type: "payment", status: "결제완료"),
  StatusCode(id: 402, type: "payment", status: "구매확정"),
  StatusCode(id: 500, type: "chatroom", status: "활성화"),
  StatusCode(id: 501, type: "chatroom", status: "비활성화"),
  StatusCode(id: 502, type: "chatroom", status: "삭제"),
  StatusCode(id: 600, type: "report", status: "대기"),
  StatusCode(id: 601, type: "report", status: "처리중"),
  StatusCode(id: 602, type: "report", status: "처리완료"),
];