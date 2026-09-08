import 'package:school_app/features/auth/domain/entities/profile.dart';

class User {
  const User({
    required this.id,
    required this.username,
    required this.role,
    this.schoolId,
    this.profile,
  });

  final int id;
  final String username;
  final String role;
  final int? schoolId;
  final Profile? profile;
}
