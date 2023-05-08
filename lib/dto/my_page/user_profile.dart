

class UserProfileUpdateReq {
  String password;
  String profile;

  UserProfileUpdateReq({
    required this.password,
    required this.profile,
  });

  factory UserProfileUpdateReq.fromJson(Map<String, dynamic> json) => UserProfileUpdateReq(
    password: json["password"],
    profile: json["profile"],
  );

  Map<String, dynamic> toJson() => {
    "password": password,
    "profile": profile,
  };
}


class UserProfileRes {
  String username;
  String email;
  String profile;
  String role;

  UserProfileRes({
    required this.username,
    required this.email,
    required this.profile,
    required this.role,
  });

  factory UserProfileRes.fromJson(Map<String, dynamic> json) => UserProfileRes(
    username: json["username"],
    email: json["email"],
    profile: json["profile"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "profile": profile,
    "role": role,
  };
}
