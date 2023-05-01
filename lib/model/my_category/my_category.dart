class MyCatagory {
  // 관심 카테고리
  final int id;
  final int userId;
  final int categoryId;
  final DateTime createdAt;

  MyCatagory({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.createdAt
  });
}

List<MyCatagory> myCategorys = [
  MyCatagory(id: 1, userId: 1, categoryId: 1,createdAt: DateTime.now()),
  MyCatagory(id: 1, userId: 1, categoryId: 2,createdAt: DateTime.now()),
  MyCatagory(id: 1, userId: 1, categoryId: 3,createdAt: DateTime.now()),
  MyCatagory(id: 1, userId: 1, categoryId: 4,createdAt: DateTime.now()),
  MyCatagory(id: 1, userId: 1, categoryId: 5,createdAt: DateTime.now()),
];
