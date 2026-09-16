import 'package:school_app/features/auth/domain/entities/user.dart';
import 'package:school_app/features/profile/data/models/profile_model.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.username,
    required super.role,
    super.schoolId,
    super.profile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id']?.toString() ?? '',
    username: json['username'] as String? ?? '',
    role: json['role'] as String? ?? '',
    schoolId: json['school_id']?.toString(),
    profile: json['profile'] is Map<String, dynamic>
        ? ProfileModel.fromJson(json['profile'] as Map<String, dynamic>)
        : null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'role': role,
    'school_id': schoolId,
    'profile': (profile as ProfileModel?)?.toJson(),
  };
}
