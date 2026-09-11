import 'package:school_app/features/auth/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class AuthSession extends Equatable {
  const AuthSession({required this.accessToken, this.refreshToken, this.user});

  final String accessToken;
  final String? refreshToken;
  final User? user;

  @override
  List<Object?> get props => [accessToken, refreshToken, user];
}
