class MockCategory {
  final int id;
  final String name;
  final DateTime createdAt;

  MockCategory({required this.id, required this.name, required this.createdAt});
}

List<MockCategory> categorys = [
  MockCategory(id: 1, name: "생활가전", createdAt: DateTime.now()),
  MockCategory(id: 2, name: "유아물품", createdAt: DateTime.now()),
  MockCategory(id: 3, name: "식품", createdAt: DateTime.now()),
  MockCategory(id: 4, name: "스포츠", createdAt: DateTime.now()),
  MockCategory(id: 5, name: "잡화", createdAt: DateTime.now()),
  MockCategory(id: 6, name: "의류", createdAt: DateTime.now()),
  MockCategory(id: 7, name: "미용", createdAt: DateTime.now()),
  MockCategory(id: 8, name: "반려동물 물품", createdAt: DateTime.now()),
  MockCategory(id: 9, name: "식물", createdAt: DateTime.now()),
  MockCategory(id: 10, name: "티켓/교환권", createdAt: DateTime.now()),
];

List<String> category_eng = [
  "household_appliances",
  "baby_goods",
  "food",
  "sports",
  "goods",
  "clothing",
  "beauty",
  "animal",
  "plants",
  "ticket"
];
