class MyCategoryList {
  List<UserCategory> list;

  MyCategoryList({
    required this.list,
  });

  factory MyCategoryList.fromJson(Map<String, dynamic> json) => MyCategoryList(
    list: List<UserCategory>.from(json["list"].map((x) => UserCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "list": List<dynamic>.from(list.map((x) => x.toJson())),
  };
}

class UserCategory {
  int id;
  User user;
  Category category;
  DateTime createdAt;

  UserCategory({
    required this.id,
    required this.user,
    required this.category,
    required this.createdAt,
  });

  factory UserCategory.fromJson(Map<String, dynamic> json) => UserCategory(
    id: json["id"],
    user: User.fromJson(json["user"]),
    category: Category.fromJson(json["category"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user.toJson(),
    "category": category.toJson(),
    "createdAt": createdAt.toIso8601String(),
  };
}

class Category {
  int id;
  String name;
  DateTime createdAt;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

class User {
  int id;
  String username;
  dynamic nickname;
  String email;
  dynamic profile;
  Rate rate;
  int ratePoint;
  String role;
  String? provider;
  String? providerId;
  int? statusCode;
  DateTime createdAt;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    username: json["username"],
    nickname: json["nickname"],
    email: json["email"],
    profile: json["profile"],
    rate: Rate.fromJson(json["rate"]),
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

class Rate {
  int id;
  String rateName;
  DateTime createdAt;

  Rate({
    required this.id,
    required this.rateName,
    required this.createdAt,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
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