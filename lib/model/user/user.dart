

class User {
  final int id;
  final String username;
  final String email;
  final String name;
  final String profile;
  final int rateId;
  final String type;
  final String role;
  final int statusCode;
  final DateTime created;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.profile,
    required this.rateId,
    required this.type,
    required this.role,
    required this.statusCode,
    required this.created,
  });
}

List<User> users = [
  User(id: 1,
      username: "ssar",
      email: "ssar@naver.com",
      name: "ssar",
      profile: "null",
      rateId: 1,
      type: "naver",
      role: "user",
      statusCode: 100,
      created: DateTime.now()),
  User(id: 2,
      username: "zzxc",
      email: "zzxc@naver.com",
      name: "zzxc",
      profile: "null",
      rateId: 2,
      type: "naver",
      role: "user",
      statusCode: 100,
      created: DateTime.now()),
  User(id: 3,
      username: "qqwe",
      email: "qqwe@naver.com",
      name: "qqwe",
      profile: "null",
      rateId: 3,
      type: "naver",
      role: "user",
      statusCode: 100,
      created: DateTime.now()),
  User(id: 4,
      username: "ppoi",
      email: "ppoi@naver.com",
      name: "ppoi",
      profile: "null",
      rateId: 4,
      type: "null",
      role: "user",
      statusCode: 100,
      created: DateTime.now())
];
