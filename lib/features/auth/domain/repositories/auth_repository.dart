import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/auth/domain/entities/auth_session.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthSession>> login(dynamic params);
  Future<Either<Failure, void>> register(dynamic params, String role);
  Future<Either<Failure, void>> resetPassword();
  Future<Either<Failure, void>> forgotPassword();
  Future<Either<Failure, void>> logout();
}
