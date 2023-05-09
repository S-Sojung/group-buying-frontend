class MyWishBoardList { // 리스트 데이터
  List<WishlistList> wishlistList;

  MyWishBoardList({
    required this.wishlistList,
  });

  factory MyWishBoardList.fromJson(Map<String, dynamic> json) => MyWishBoardList(
    wishlistList: List<WishlistList>.from(json["wishlistList"].map((x) => WishlistList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "wishlistList": List<dynamic>.from(wishlistList.map((x) => x.toJson())),
  };
}

class WishlistListData { // 단일 데이터
  WishlistList wishlist;

  WishlistListData({
    required this.wishlist,
  });

  factory WishlistListData.fromJson(Map<String, dynamic> json) => WishlistListData(
    wishlist: WishlistList.fromJson(json["wishlist"]),
  );

  Map<String, dynamic> toJson() => {
    "wishlist": wishlist.toJson(),
  };
}



class WishlistList {
  int id;
  MyWishUser user;
  MyWishBoard board;
  DateTime createdAt;

  WishlistList({
    required this.id,
    required this.user,
    required this.board,
    required this.createdAt,
  });

  factory WishlistList.fromJson(Map<String, dynamic> json) => WishlistList(
    id: json["id"],
    user: MyWishUser.fromJson(json["user"]),
    board: MyWishBoard.fromJson(json["board"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user.toJson(),
    "board": board.toJson(),
    "createdAt": createdAt.toIso8601String(),
  };
}

class MyWishBoard {
  int id;
  MyWishCategory category;
  String title;
  MyWishUser organizer;
  String content;
  String? img;
  MyWishEvent event;
  int? statusCode;
  int? views;
  bool recommend;
  String state;
  String city;
  String town;
  DateTime createdAt;

  MyWishBoard({
    required this.id,
    required this.category,
    required this.title,
    required this.organizer,
    required this.content,
    this.img,
    required this.event,
    this.statusCode,
    this.views,
    required this.recommend,
    required this.state,
    required this.city,
    required this.town,
    required this.createdAt,
  });

  factory MyWishBoard.fromJson(Map<String, dynamic> json) => MyWishBoard(
    id: json["id"],
    category: MyWishCategory.fromJson(json["category"]),
    title: json["title"],
    organizer: MyWishUser.fromJson(json["organizer"]),
    content: json["content"],
    img: json["img"],
    event: MyWishEvent.fromJson(json["event"]),
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

class MyWishCategory {
  int? id;
  String name;
  DateTime createdAt;

  MyWishCategory({
    this.id,
    required this.name,
    required this.createdAt,
  });

  factory MyWishCategory.fromJson(Map<String, dynamic> json) => MyWishCategory(
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

class MyWishEvent {
  int id;
  double latitude;
  double longtitude;
  int qty;
  String paymentType;
  DateTime startAt;
  DateTime endAt;
  int price;
  DateTime createdAt;

  MyWishEvent({
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

  factory MyWishEvent.fromJson(Map<String, dynamic> json) => MyWishEvent(
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

class MyWishUser {
  int id;
  String username;
  String? nickname;
  String email;
  String? profile;
  MyWishRate rate;
  int? ratePoint;
  String? role;
  String? provider;
  String? providerId;
  int? statusCode;
  DateTime createdAt;

  MyWishUser({
    required this.id,
    required this.username,
    this.nickname,
    required this.email,
    this.profile,
    required this.rate,
    this.ratePoint,
    this.role,
    this.provider,
    this.providerId,
    this.statusCode,
    required this.createdAt,
  });

  factory MyWishUser.fromJson(Map<String, dynamic> json) => MyWishUser(
    id: json["id"],
    username: json["username"],
    nickname: json["nickname"],
    email: json["email"],
    profile: json["profile"],
    rate: MyWishRate.fromJson(json["rate"]),
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

class MyWishRate {
  int id;
  String rateName;
  DateTime createdAt;

  MyWishRate({
    required this.id,
    required this.rateName,
    required this.createdAt,
  });

  factory MyWishRate.fromJson(Map<String, dynamic> json) => MyWishRate(
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