class MyLocation {
  String town;

  MyLocation({
    required this.town,
  });

  factory MyLocation.fromJson(Map<String, dynamic> json) => MyLocation(
    town: json["town"],
  );

  Map<String, dynamic> toJson() => {
    "town": town,
  };
}
