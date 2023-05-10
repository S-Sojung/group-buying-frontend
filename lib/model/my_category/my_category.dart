class MyCategory {
  // 관심 카테고리
  final int id;
  final int userId;
  final int categoryId;
  final DateTime createdAt;

  MyCategory({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.createdAt
  });

}

List<MyCategory> myCategorys = [
  MyCategory(id: 1, userId: 1, categoryId: 1,createdAt: DateTime.now()),
  MyCategory(id: 1, userId: 1, categoryId: 11,createdAt: DateTime.now()),
  MyCategory(id: 1, userId: 1, categoryId: 9,createdAt: DateTime.now()),
  MyCategory(id: 1, userId: 1, categoryId: 8,createdAt: DateTime.now()),
];
