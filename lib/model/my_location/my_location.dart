class MyLocation {
  // 내지역 설정
  final int id;
  final int userId;
  final String state; // 도,광역시 단위
  final String city; // 시군구 단위
  final String town;

  MyLocation({
    required this.id,
    required this.userId,
    required this.state,
    required this.city,
    required this.town,
  }); // 읍면동 단위
}

List<MyLocation> myLocations=[
  MyLocation(id: 1, userId: 1, state: "부산광역시", city: "부산진구", town: "부전동")
];