class Report {
  final int id;
  final int reporterId; // 신고자 유저 id
  final int reportedId; // 피신고자 유저 id
  final int boardId; // 공고 id
  final String title; // 제목
  final String content; // 신고 내용
  final String reportType; // 신고 타입 분류
  final int statusCode; // 상태 (접수 처리 ...)
  final DateTime createdAt;

  Report({
    required this.id,
    required this.reporterId,
    required this.reportedId,
    required this.boardId,
    required this.title,
    required this.content,
    required this.reportType,
    required this.statusCode,
    required this.createdAt,
  });
}
List<Report> reports=[
  Report(id: 1, reporterId: 4, reportedId: 1, boardId: 1, title: "노쇼했어요", content: "삼각김밥 1+1 하자는데 어디에있는지 연락도 안되고 노쇼 했어요", reportType: "노쇼", statusCode: 600, createdAt: DateTime.now())
];