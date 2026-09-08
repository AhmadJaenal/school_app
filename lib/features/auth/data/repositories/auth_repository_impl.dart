import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/auth/domain/entities/auth_session.dart';
import 'package:school_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, void>> forgotPassword() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthSession>> login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> resetPassword() {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
