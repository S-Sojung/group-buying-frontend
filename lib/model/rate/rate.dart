class Rate {
  // 신뢰도
  final int id;
  final int userId;
  final String rateName; // 신뢰도 등급
  final int ratePoint; // 신뢰도 점수
  final String rateImg; // 등급 이미지 // 이거 굳이 여기 저장 안하고 서버에 있는 이미지 사용해도 될듯?

  Rate({
    required this.id,
    required this.userId,
    required this.rateName,
    required this.ratePoint,
    required this.rateImg,
  });
}

//수정 될 수 있음
List<Rate> rates = [
  Rate(id: 1, userId: 1, rateName: "글레이즈드", ratePoint: 30, rateImg: "img"),
  Rate(id: 2, userId: 2, rateName: "딸기도넛", ratePoint: 70, rateImg: "img"),
  Rate(id: 3, userId: 3, rateName: "초코도넛", ratePoint: 40, rateImg: "img"),
  Rate(id: 4, userId: 4, rateName: "별사탕도넛", ratePoint: 120, rateImg: "img"),
];
