import 'package:equatable/equatable.dart';
import 'package:school_app/features/profile/domain/entities/profile.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.username,
    required this.role,
    this.schoolId,
    this.profile,
  });

  final String id;
  final String username;
  final String role;
  final String? schoolId;
  final Profile? profile;

  @override
  List<Object?> get props => [id, username, role, schoolId, profile];
}
