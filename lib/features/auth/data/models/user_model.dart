import 'package:school_app/features/auth/data/models/profile_model.dart';
import 'package:school_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.username,
    required super.role,
    super.schoolId,
    super.profile,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: (json['id'] as num).toInt(),
    username: json['username'] as String? ?? '',
    role: json['role'] as String? ?? '',
    schoolId: (json['school_id'] as num?)?.toInt(),
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
