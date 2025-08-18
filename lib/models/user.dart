class User {
  final int id;
  final String name;
  final String email;
  final String token;
  final List<String> roles;
  final List<String> permissions;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.roles,
    required this.permissions,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      token: json['token'],
      roles: List<String>.from(json['roles'].map((role) => role)),
      permissions: List<String>.from(
          json['permissions'].map((permission) => permission)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
=======
  final int? id;
  final int? schoolId;
  final String? fullName;
  final String? email;
  final String? accessToken;
  final String? token;
  final List? permissions;
  final List? roles;

  User({
    this.id,
    this.schoolId,
    this.fullName,
    this.email,
    this.accessToken,
    this.token,
    this.permissions,
    this.roles,
  });

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      id: json['id'],
      schoolId: json['school_id'] ?? 0,
      fullName: json['name'],
      email: json['email'],
      accessToken: json['access_token'].toString(),
      token: json['type_token'],
      permissions: json['permissions'],
      roles: json['roles'],
    );
  }

  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => User.fromJson(json)).toList();
  }
}
