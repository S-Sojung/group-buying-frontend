class MyLocationUpdateReqDTO {
  final String state;
  final String city;
  final String town;

  MyLocationUpdateReqDTO({
    required this.state,
    required this.city,
    required this.town,
  });

  Map<String, dynamic> toJson() => {
    "state": state,
    "city": city,
    "town": town,
  };
}