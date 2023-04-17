class Tag { // 태그
  final int id;
  final int boardId;
  final String comment;

  Tag({
    required this.id,
    required this.boardId,
    required this.comment,
  });
}

List<Tag> tags = [
  Tag(id: 1, boardId: 1, comment: "편의점"),
  Tag(id: 2, boardId: 1, comment: "1+1")
];