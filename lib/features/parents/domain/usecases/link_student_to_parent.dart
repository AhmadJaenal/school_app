import 'package:dartz/dartz.dart';
import 'package:school_app/core/error/failure.dart';
import 'package:school_app/features/parents/domain/repositories/parents_repository.dart';

class LinkStudentToParent {
  LinkStudentToParent(this._repository);
  final ParentsRepository _repository;

  Future<Either<Failure, bool>> call(int parentId, dynamic params) =>
      _repository.linkStudentToParent(parentId, params);
}
