class Wishlist { // 관심 목록
  final int id;
  final int userId;
  final int boardId;
  final DateTime createdAt;

  Wishlist({
    required this.id,
    required this.userId,
    required this.boardId,
    required this.createdAt
  });
}
List<Wishlist> wishlists = [
  Wishlist(id: 1, userId: 2, boardId: 1,createdAt: DateTime.now())
];