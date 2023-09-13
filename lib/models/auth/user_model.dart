class UserModel {
  UserModel({
    this.token,
    required this.user,
  });

  String? token;
  UserResponse user;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        token: json["token"],
        user: UserResponse.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
      };
}

class UserResponse {
  int? id;
  DateTime? lastLogin;
  bool? isSuperuser;
  String username;
  String? firstName;
  String? lastName;
  String? email;
  bool? isStaff;
  bool? isActive;
  DateTime? dateJoined;

  UserResponse({
    this.id,
    this.lastLogin,
    this.isSuperuser,
    required this.username,
    this.firstName,
    this.lastName,
    required this.email,
    this.isStaff,
    this.isActive,
    this.dateJoined,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
      id: json["id"],
      lastLogin: json["last_login"] != null
          ? DateTime.parse(json["last_login"])
          : json["last_login"],
      isSuperuser: json["is_superuser"],
      username: json["username"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      isStaff: json["is_staff"],
      isActive: json["is_active"],
      dateJoined: json["date_joined"] != null
          ? DateTime.parse(json["date_joined"])
          : json["date_joined"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "last_login": lastLogin?.toIso8601String(),
        "is_superuser": isSuperuser,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined?.toIso8601String(),
      };
}

class UserRequest {
  String username;
  String password;
  String email;

  UserRequest({
    required this.username,
    required this.password,
    required this.email,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) => UserRequest(
        username: json["username"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
      };
}
