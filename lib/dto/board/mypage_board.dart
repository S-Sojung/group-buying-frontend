class MyPageBoard {
  List<MyBoard> board;

  MyPageBoard({
    required this.board,
  });

  factory MyPageBoard.fromJson(Map<String, dynamic> json) => MyPageBoard(
    board: List<MyBoard>.from(json["board"].map((x) => MyBoard.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "board": List<dynamic>.from(board.map((x) => x.toJson())),
  };
}

class MyBoard {
  int id;
  MyBoardCategory category;
  String title;
  MyBoardOrganizer organizer;
  String content;
  String? img;
  MyBoardEvent event;
  int? statusCode;
  int views;
  bool recommend;
  String state;
  String city;
  String town;
  DateTime createdAt;

  MyBoard({
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

  factory MyBoard.fromJson(Map<String, dynamic> json) => MyBoard(
    id: json["id"],
    category: MyBoardCategory.fromJson(json["category"]),
    title: json["title"],
    organizer: MyBoardOrganizer.fromJson(json["organizer"]),
    content: json["content"],
    img: json["img"],
    event: MyBoardEvent.fromJson(json["event"]),
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

class MyBoardCategory {
  int id;
  String name;
  DateTime createdAt;

  MyBoardCategory({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory MyBoardCategory.fromJson(Map<String, dynamic> json) => MyBoardCategory(
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

class MyBoardEvent {
  int id;
  double latitude;
  double longtitude;
  int qty;
  String paymentType;
  DateTime startAt;
  DateTime endAt;
  int price;
  DateTime createdAt;

  MyBoardEvent({
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

  factory MyBoardEvent.fromJson(Map<String, dynamic> json) => MyBoardEvent(
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

class MyBoardOrganizer {
  int id;
  String username;
  String? nickname;
  String email;
  String? profile;
  MyBoardRate rate;
  int ratePoint;
  String role;
  String? provider;
  String? providerId;
  int? statusCode;
  DateTime createdAt;

  MyBoardOrganizer({
    required this.id,
    required this.username,
    this.nickname,
    required this.email,
    required this.profile,
    required this.rate,
    required this.ratePoint,
    required this.role,
    this.provider,
    this.providerId,
    this.statusCode,
    required this.createdAt,
  });

  factory MyBoardOrganizer.fromJson(Map<String, dynamic> json) => MyBoardOrganizer(
    id: json["id"],
    username: json["username"],
    nickname: json["nickname"],
    email: json["email"],
    profile: json["profile"],
    rate: MyBoardRate.fromJson(json["rate"]),
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

class MyBoardRate {
  int id;
  String? rateName;
  DateTime createdAt;

  MyBoardRate({
    required this.id,
    this.rateName,
    required this.createdAt,
  });

  factory MyBoardRate.fromJson(Map<String, dynamic> json) => MyBoardRate(
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