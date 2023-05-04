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
  MyCategory(id: 1, userId: 1, categoryId: 2,createdAt: DateTime.now()),
  MyCategory(id: 1, userId: 1, categoryId: 3,createdAt: DateTime.now()),
  MyCategory(id: 1, userId: 1, categoryId: 4,createdAt: DateTime.now()),
  MyCategory(id: 1, userId: 1, categoryId: 5,createdAt: DateTime.now()),
];
