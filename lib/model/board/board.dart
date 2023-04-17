class Board {
  // 게시글
  final int id;
  final int categoryId;
  final String title;
  final int organizerId;
  final String content;
  final String img;
  final int eventId;
  final int statusCode;
  final int views;
  final bool wish;
  final DateTime createdAt;

  Board(
      {required this.id,
      required this.categoryId,
      required this.title,
      required this.organizerId,
      required this.content,
      required this.img,
      required this.eventId,
      required this.statusCode,
      required this.views,
      required this.wish,
      required this.createdAt});
}

List<Board> boards = [
  Board(
      id: 1,
      categoryId: 3,
      title: "삼각김밥 1+1 같이 사실분?",
      organizerId: 1,
      content: "서면 1번출구 편의점에서 삼각김밥 같이 사실분 구합니다. 직거래 우선이요",
      img: "img",
      eventId: 1,
      statusCode: 200,
      views: 50,
      wish: false,
      createdAt: DateTime.now()),
  Board(
      id: 2,
      categoryId: 3,
      title: "편의점 할인 행사 같이 사실분",
      organizerId: 1,
      content: "서면 1번출구 편의점에서 삼각김밥 같이 사실분 구합니다. 직거래 우선이요",
      img: "img",
      eventId: 2,
      statusCode: 200,
      views: 50,
      wish: false,
      createdAt: DateTime.now()),
];
