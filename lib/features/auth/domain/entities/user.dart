import 'package:school_app/features/auth/domain/entities/profile.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
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

  @override
  List<Object?> get props => [id, username, role, schoolId, profile];
}
