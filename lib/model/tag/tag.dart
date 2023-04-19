class Tag { // 태그
  final int id;
  final int boardId;
  final String comment;
  final DateTime createdAt;

  Tag({
    required this.id,
    required this.boardId,
    required this.comment,
    required this.createdAt
  });
}

List<Tag> tags = [
  Tag(id: 1, boardId: 1, comment: "편의점",createdAt: DateTime.now()),
  Tag(id: 2, boardId: 1, comment: "1+1",createdAt:  DateTime.now())
];