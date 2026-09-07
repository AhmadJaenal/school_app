class User {
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
      fullName: json['name'] ?? json['full_name'],
      email: json['email'],
      accessToken: json['access_token']?.toString(),
      token: json['type_token'] ?? json['token'],
      permissions: json['permissions'],
      roles: json['roles'],
    );
  }

  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => User.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'school_id': schoolId,
      'name': fullName,
      'email': email,
      'access_token': accessToken,
      'type_token': token,
      'permissions': permissions,
      'roles': roles,
    };
  }
}
