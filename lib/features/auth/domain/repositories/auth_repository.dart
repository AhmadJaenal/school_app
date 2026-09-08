import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/auth/domain/entities/auth_session.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthSession>> login();
  Future<Either<Failure, void>> register();
  Future<Either<Failure, void>> resetPassword();
  Future<Either<Failure, void>> forgotPassword();
}
