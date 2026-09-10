import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/auth/domain/repositories/auth_repository.dart';

class Logout {
  Logout(this._repository);
  final AuthRepository _repository;

  Future<Either<Failure, void>> call() => _repository.logout();
}
