class MocBoard {
  // 게시글
  final int id;
  final int categoryId;
  final String? title;
  final int organizerId;
  final String? content;
  final String? img;
  final int eventId;
  final int? statusCode;
  final int? views;
  final bool recommend;
  final String? state;
  final String? city;
  final String? town;
  final DateTime createdAt;

  MocBoard(
      {required this.id,
      required this.categoryId,
      required this.title,
      required this.organizerId,
      required this.content,
      required this.img,
      required this.eventId,
      required this.statusCode,
      required this.views,
        required this.recommend,
        required this.state,
        required this.city,
        required this.town,
        required this.createdAt});
}

List<MocBoard> boards = [
  MocBoard(
      id: 1,
      categoryId: 3,
      title: "삼각김밥 1+1 같이 사실분?",
      organizerId: 1,
      content: "서면 1번출구 편의점에서 삼각김밥 같이 사실분 구합니다. 직거래 우선이요",
      img: "img",
      eventId: 1,
      statusCode: 200,
      views: 50,
      recommend: false,
      state: "부산",
      city: "부산진구",
      town: "부전동",
      createdAt: DateTime.now(),),
  MocBoard(
      id: 2,
      categoryId: 3,
      title: "편의점 할인 행사 같이 사실분",
      organizerId: 1,
      content: "서면 1번출구 편의점에서 삼각김밥 같이 사실분 구합니다. 직거래 우선이요",
      img: "img",
      eventId: 2,
      statusCode: 200,
      views: 50,
      recommend: false,
      state: "부산",
      city: "부산진구",
      town: "부전동",
      createdAt: DateTime.now()),
  MocBoard(
      id: 3,
      categoryId: 3,
      title: "편의점 할인 행사 같이 사실분",
      organizerId: 1,
      content: "서면 1번출구 편의점에서 삼각김밥 같이 사실분 구합니다. 직거래 우선이요",
      img: "img",
      eventId: 3,
      statusCode: 200,
      views: 50,
      recommend: false,
      state: "부산",
      city: "부산진구",
      town: "부전동",
      createdAt: DateTime.now()),
  MocBoard(
      id: 4,
      categoryId: 3,
      title: "편의점 할인 행사 같이 사실분",
      organizerId: 1,
      content: "서면 1번출구 편의점에서 삼각김밥 같이 사실분 구합니다. 직거래 우선이요",
      img: "img",
      eventId: 4,
      statusCode: 200,
      views: 50,
      recommend: false,
      state: "부산",
      city: "부산진구",
      town: "부전동",
      createdAt: DateTime.now()),
  MocBoard(
      id: 5,
      categoryId: 3,
      title: "편의점 할인 행사 같이 사실분",
      organizerId: 1,
      content: "서면 1번출구 편의점에서 삼각김밥 같이 사실분 구합니다. 직거래 우선이요",
      img: "img",
      eventId: 5,
      statusCode: 200,
      views: 50,
      recommend: false,
      state: "부산",
      city: "부산진구",
      town: "부전동",
      createdAt: DateTime.now()),
  MocBoard(
      id: 6,
      categoryId: 3,
      title: "편의점 할인 행사 같이 사실분",
      organizerId: 1,
      content: "서면 1번출구 편의점에서 삼각김밥 같이 사실분 구합니다. 직거래 우선이요",
      img: "img",
      eventId: 6,
      statusCode: 200,
      views: 50,
      recommend: false,
      state: "부산",
      city: "부산진구",
      town: "부전동",
      createdAt: DateTime.now()),
  MocBoard(
      id: 7,
      categoryId: 3,
      title: "편의점 할인 행사 같이 사실분",
      organizerId: 1,
      content: "서면 1번출구 편의점에서 삼각김밥 같이 사실분 구합니다. 직거래 우선이요",
      img: "img",
      eventId: 7,
      statusCode: 200,
      views: 50,
      recommend: false,
      state: "부산",
      city: "부산진구",
      town: "부전동",
      createdAt: DateTime.now()),
];
