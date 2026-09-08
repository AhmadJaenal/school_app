import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/auth/domain/repositories/auth_repository.dart';

class ResetPassword {
  final AuthRepository _repository;
  ResetPassword(this._repository);

  Future<Either<Failure, void>> execute() {
    return _repository.resetPassword();
  }
}
