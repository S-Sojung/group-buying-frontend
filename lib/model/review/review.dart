class Review {
  final int id;
  final int reviewerId; // 작성자
  final int reviewedId; // 대상자
  final int score; // 별점
  final String comment; // 내용
  final DateTime createdAt;

  Review({
    required this.id,
    required this.reviewerId,
    required this.reviewedId,
    required this.score,
    required this.comment,
    required this.createdAt,
  });
}

List<Review> reviews = [
  Review(id: 1, reviewerId: 2, reviewedId: 1, score: 5, comment: "빠른거래 좋아요", createdAt: DateTime.now())
];