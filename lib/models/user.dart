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
      schoolId: json['school_id'],
      fullName: json['name'],
      email: json['email'],
      accessToken: json['access_token'],
      token: json['type_token'],
      permissions: json['permissions'],
      roles: json['roles'],
    );
  }

  static List<User> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => User.fromJson(json)).toList();
  }
}
