class MockCategory {
  final int id;
  final String name;

  MockCategory({required this.id, required this.name});
}

List<MockCategory> mockCategories = [
  MockCategory(id: 1, name: "생활가전"),
  MockCategory(id: 2, name: "스포츠"),
  MockCategory(id: 3, name: "잡화"),
  MockCategory(id: 4, name: "유아물품"),
  MockCategory(id: 5, name: "의류"),
  MockCategory(id: 6, name: "식품"),
  MockCategory(id: 7, name: "미용"),
  MockCategory(id: 8, name: "반려동물 물품"),
  MockCategory(id: 9, name: "식물"),
  MockCategory(id: 10, name: "문구"),
  MockCategory(id: 11, name: "티켓 및 교환권"),
];

List<String> category_eng = [
  "household_appliances",
  "sports",
  "goods",
  "baby_goods",
  "clothing",
  "food",
  "beauty",
  "animal",
  "plants",
  "pencil",
  "ticket"
];
