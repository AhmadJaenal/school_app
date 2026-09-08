import 'package:school_app/features/auth/domain/entities/user.dart';

class AuthSession {
  const AuthSession({required this.accessToken, this.refreshToken, this.user});

  final String accessToken;
  final String? refreshToken;
  final User? user;
}
