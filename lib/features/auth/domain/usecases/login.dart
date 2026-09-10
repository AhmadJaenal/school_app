import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/auth/domain/entities/auth_session.dart';
import 'package:school_app/features/auth/domain/repositories/auth_repository.dart';

class Login {
  final AuthRepository _repository;
  Login(this._repository);

  Future<Either<Failure, AuthSession>> execute(dynamic params) {
    return _repository.login(params);
  }
}
