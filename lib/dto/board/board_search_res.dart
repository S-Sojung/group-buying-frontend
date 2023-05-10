class BoardSearchRes {
  int id;
  SearchCategory category;
  String title;
  SearchOrganizer organizer;
  String content;
  String img;
  SearchEvent event;
  int? statusCode;
  int? views;
  bool recommend;
  String state;
  String city;
  String town;
  DateTime createdAt;

  BoardSearchRes({
    required this.id,
    required this.category,
    required this.title,
    required this.organizer,
    required this.content,
    required this.img,
    required this.event,
    this.statusCode,
    this.views,
    required this.recommend,
    required this.state,
    required this.city,
    required this.town,
    required this.createdAt,
  });

  factory BoardSearchRes.fromJson(Map<String, dynamic> json) => BoardSearchRes(
    id: json["id"],
    category: SearchCategory.fromJson(json["category"]),
    title: json["title"],
    organizer: SearchOrganizer.fromJson(json["organizer"]),
    content: json["content"],
    img: json["img"],
    event: SearchEvent.fromJson(json["event"]),
    statusCode: json["statusCode"],
    views: json["views"],
    recommend: json["recommend"],
    state: json["state"],
    city: json["city"],
    town: json["town"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category": category.toJson(),
    "title": title,
    "organizer": organizer.toJson(),
    "content": content,
    "img": img,
    "event": event.toJson(),
    "statusCode": statusCode,
    "views": views,
    "recommend": recommend,
    "state": state,
    "city": city,
    "town": town,
    "createdAt": createdAt.toIso8601String(),
  };
}

class SearchCategory {
  int id;
  String name;
  DateTime createdAt;

  SearchCategory({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory SearchCategory.fromJson(Map<String, dynamic> json) => SearchCategory(
    id: json["id"],
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "createdAt": createdAt.toIso8601String(),
  };
}

class SearchEvent {
  int id;
  double latitude;
  double longtitude;
  int qty;
  String paymentType;
  DateTime startAt;
  DateTime endAt;
  int price;
  DateTime createdAt;

  SearchEvent({
    required this.id,
    required this.latitude,
    required this.longtitude,
    required this.qty,
    required this.paymentType,
    required this.startAt,
    required this.endAt,
    required this.price,
    required this.createdAt,
  });

  factory SearchEvent.fromJson(Map<String, dynamic> json) => SearchEvent(
    id: json["id"],
    latitude: json["latitude"]?.toDouble(),
    longtitude: json["longtitude"]?.toDouble(),
    qty: json["qty"],
    paymentType: json["paymentType"],
    startAt: DateTime.parse(json["startAt"]),
    endAt: DateTime.parse(json["endAt"]),
    price: json["price"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "latitude": latitude,
    "longtitude": longtitude,
    "qty": qty,
    "paymentType": paymentType,
    "startAt": startAt.toIso8601String(),
    "endAt": endAt.toIso8601String(),
    "price": price,
    "createdAt": createdAt.toIso8601String(),
  };
}

class SearchOrganizer {
  int id;
  String username;
  String nickname;
  String email;
  dynamic profile;
  SearchRate rate;
  int ratePoint;
  String role;
  String provider;
  String providerId;
  int statusCode;
  DateTime createdAt;

  SearchOrganizer({
    required this.id,
    required this.username,
    required this.nickname,
    required this.email,
    this.profile,
    required this.rate,
    required this.ratePoint,
    required this.role,
    required this.provider,
    required this.providerId,
    required this.statusCode,
    required this.createdAt,
  });

  factory SearchOrganizer.fromJson(Map<String, dynamic> json) => SearchOrganizer(
    id: json["id"],
    username: json["username"],
    nickname: json["nickname"],
    email: json["email"],
    profile: json["profile"],
    rate: SearchRate.fromJson(json["rate"]),
    ratePoint: json["ratePoint"],
    role: json["role"],
    provider: json["provider"],
    providerId: json["providerId"],
    statusCode: json["statusCode"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "nickname": nickname,
    "email": email,
    "profile": profile,
    "rate": rate.toJson(),
    "ratePoint": ratePoint,
    "role": role,
    "provider": provider,
    "providerId": providerId,
    "statusCode": statusCode,
    "createdAt": createdAt.toIso8601String(),
  };
}

class SearchRate {
  int id;
  String rateName;
  DateTime createdAt;

  SearchRate({
    required this.id,
    required this.rateName,
    required this.createdAt,
  });

  factory SearchRate.fromJson(Map<String, dynamic> json) => SearchRate(
    id: json["id"],
    rateName: json["rateName"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rateName": rateName,
    "createdAt": createdAt.toIso8601String(),
  };
}