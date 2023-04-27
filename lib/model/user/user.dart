

class DonutUser {
  final int id;
  final String email;
  String? name;
  String? profile;
  final int rateId;
  final String type;
  final String role;
  int? statusCode;
  final DateTime created;

  DonutUser({
    required this.id,
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

List<DonutUser> users = [
  DonutUser(id: 1,
      email: "ssar@naver.com",
      name: "ssar",
      profile: "null",
      rateId: 1,
      type: "naver",
      role: "user",
      statusCode: 100,
      created: DateTime.now()),
  DonutUser(id: 2,
      email: "zzxc@naver.com",
      name: "zzxc",
      profile: "null",
      rateId: 2,
      type: "naver",
      role: "user",
      statusCode: 100,
      created: DateTime.now()),
  DonutUser(id: 3,
      email: "qqwe@naver.com",
      name: "qqwe",
      profile: "null",
      rateId: 3,
      type: "naver",
      role: "user",
      statusCode: 100,
      created: DateTime.now()),
  DonutUser(id: 4,
      email: "ppoi@naver.com",
      name: "ppoi",
      profile: "null",
      rateId: 4,
      type: "null",
      role: "user",
      statusCode: 100,
      created: DateTime.now())
];
