import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/auth/domain/repositories/auth_repository.dart';

class Register {
  final AuthRepository _repository;
  Register(this._repository);

  Future<Either<Failure, void>> execute() {
    return _repository.register();
  }
}
