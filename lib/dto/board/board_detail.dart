class BoardDetailDto {
  BoardDetail board;
  List<dynamic> tagList;

  BoardDetailDto({
    required this.board,
    required this.tagList,
  });

  factory BoardDetailDto.fromJson(Map<String, dynamic> json) => BoardDetailDto(
    board: BoardDetail.fromJson(json["board"]),
    tagList: List<dynamic>.from(json["tagList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "board": board.toJson(),
    "tagList": List<dynamic>.from(tagList.map((x) => x)),
  };
}

class BoardDetail {
  int id;
  BoardDetailCategory category;
  String title;
  Organizer organizer;
  String content;
  String? img;
  BoardDetailEvent event;
  int? statusCode;
  int views;
  bool recommend;
  String state;
  String city;
  String town;
  DateTime createdAt;

  BoardDetail({
    required this.id,
    required this.category,
    required this.title,
    required this.organizer,
    required this.content,
    this.img,
    required this.event,
    this.statusCode,
    required this.views,
    required this.recommend,
    required this.state,
    required this.city,
    required this.town,
    required this.createdAt,
  });

  factory BoardDetail.fromJson(Map<String, dynamic> json) => BoardDetail(
    id: json["id"],
    category: BoardDetailCategory.fromJson(json["category"]),
    title: json["title"],
    organizer: Organizer.fromJson(json["organizer"]),
    content: json["content"],
    img: json["img"],
    event: BoardDetailEvent.fromJson(json["event"]),
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

class BoardDetailCategory {
  int id;
  String name;
  DateTime createdAt;

  BoardDetailCategory({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory BoardDetailCategory.fromJson(Map<String, dynamic> json) => BoardDetailCategory(
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

class BoardDetailEvent {
  int id;
  double latitude;
  double longtitude;
  int qty;
  String paymentType;
  DateTime startAt;
  DateTime endAt;
  int price;
  DateTime createdAt;

  BoardDetailEvent({
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

  factory BoardDetailEvent.fromJson(Map<String, dynamic> json) => BoardDetailEvent(
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

class Organizer {
  int id;
  String username;
  String? nickname;
  String email;
  String? profile;
  BoardDetailRate rate;
  int ratePoint;
  String role;
  String? provider;
  String? providerId;
  int? statusCode;
  DateTime createdAt;

  Organizer({
    required this.id,
    required this.username,
    this.nickname,
    required this.email,
    this.profile,
    required this.rate,
    required this.ratePoint,
    required this.role,
    this.provider,
    this.providerId,
    this.statusCode,
    required this.createdAt,
  });

  factory Organizer.fromJson(Map<String, dynamic> json) => Organizer(
    id: json["id"],
    username: json["username"],
    nickname: json["nickname"],
    email: json["email"],
    profile: json["profile"],
    rate: BoardDetailRate.fromJson(json["rate"]),
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

class BoardDetailRate {
  int id;
  String rateName;
  DateTime createdAt;

  BoardDetailRate({
    required this.id,
    required this.rateName,
    required this.createdAt,
  });

  factory BoardDetailRate.fromJson(Map<String, dynamic> json) => BoardDetailRate(
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
